# capistranoのバージョン
lock '3.16.0'

# アプリケーション名
set :application, 'gakutabi'

# cloneするgitのレポジトリ
set :repo_url, 'git@github.com:kimino98/gakutabi.git'

# シンボリックリンクをはるフォルダ。
set :rbenv_type, :user
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# rubyのバージョン
set :rbenv_ruby, '2.6.5'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/gakutabi.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }

set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end



