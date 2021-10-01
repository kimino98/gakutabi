app_path = File.expand_path('../../../', __FILE__)

worker_processes 1

working_directory "#{app_path}/current"

pid "#{app_path}/shared/tmp/pids/unicorn.pid"

listen "#{app_path}/shared/tmp/sockets/unicorn.sock"

stderr_path "#{app_path}/shared/log/unicorn.stderr.log"

stdout_path "#{app_path}/shared/log/unicorn.stdout.log"
timeout 60

preload_app true
GC.respond_to?(:copy_on_write_friendly=) && GC.copy_on_write_friendly = true

check_client_connection false

run_once = true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!

  if run_once
    run_once = false # prevent from firing again
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      logger.error e
    end
  end
end

after_fork do |_server, _worker|
  defined?(ActiveRecord::Base) && ActiveRecord::Base.establish_connection
end

# $worker  = 2
# $timeout = 30
# $app_dir = "/var/www/rails/gakutabi" #自分のアプリケーション名
# $listen  = File.expand_path 'tmp/sockets/.unicorn.sock', $app_dir
# $pid     = File.expand_path 'tmp/pids/unicorn.pid', $app_dir
# $std_log = File.expand_path 'log/unicorn.log', $app_dir
# # set config
# worker_processes  $worker
# working_directory $app_dir
# stderr_path $std_log
# stdout_path $std_log
# timeout $timeout
# listen  $listen
# pid $pid
# # loading booster
# preload_app true
# # before starting processes
# before_fork do |server, worker|
#   defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

#   old_pid = "#{server.config[:pid]}.oldbin"
#   if old_pid != server.pid
#     begin
#       Process.kill "QUIT", File.read(old_pid).to_i
#     rescue Errno::ENOENT, Errno::ESRCH
#     end
#   end
# end
# # after finishing processes
# after_fork do |server, worker|
#   defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
# end