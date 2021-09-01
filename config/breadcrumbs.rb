crumb :root do
  link "投稿一覧", root_path
end

crumb :user_new do
  link "新規登録", new_user_registration_path
  parent :root
end

crumb :login do
  link "サインイン", new_user_session_path
  parent :root
end

crumb :review_new do
  link "新規投稿", new_review_path
  parent :root
end

crumb :review_show do |review|
  link "投稿詳細", review_path(review)
  parent :root
end

crumb :search do
  link "検索結果", search_reviews_path
  parent :root
end

crumb :review_edit do |review|
  link "投稿編集"
  parent :review_show,review
end

crumb :user_show do |user|
  link "#{user.nickname}さんの詳細", user_path(user)
  parent :root
end

crumb :user_edit do |user|
  link "マイページ編集"
  parent :user_show,user
end




