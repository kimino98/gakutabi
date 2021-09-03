module PostSupport
  def post(review)
    # 投稿ページに移動する
    visit new_review_path
    # フォームに情報を入力する
    fill_in 'review[faclity_name]', with: @review.faclity_name
    find('#review_event_id').find("option[value='#{@review.event_id}']").select_option
    find('#review_hotel_type_id').find("option[value='#{@review.hotel_type_id}']").select_option
    find('#review_grade_id').find("option[value='#{@review.grade_id}']").select_option
    find('#review_season_id').find("option[value='#{@review.season_id}']").select_option
    find('#review_region_id').find("option[value='#{@review.region_id}']").select_option
    find('#review_student_count_id').find("option[value='#{@review.student_count_id}']").select_option
    fill_in 'review[price]', with: @review.price
    fill_in 'review[text]', with: @review.text
    fill_in 'review[safety]', with: @review.safety
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('review[images][]', image_path, make_visible: true)
    # 送信するとTweetモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Review.count }.by(1)
    # 投稿一覧ページに遷移することを確認する
    expect(current_path).to eq(root_path)
  end
end
