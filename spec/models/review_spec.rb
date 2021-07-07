require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end

  describe '投稿機能' do
    context '投稿できるとき' do
      it '全ての情報が正しく入力されいるとき' do
        expect(@review).to be_valid
      end
    end

    context '投稿が失敗するとき' do
      it 'faclity_nameが空だと投稿できない' do
        @review.faclity_name = nil
        @review.valid?
        expect(@review.errors.full_messages).to include('施設名を入力してください')
      end

      it 'faclity_nameが40文字以上だと投稿できない' do
        @review.faclity_name = '東京遊園地' * 40
        @review.valid?
        expect(@review.errors.full_messages).to include('施設名は40文字以内で入力してください')
      end

      it 'hotel_type_idが空の場合投稿できない' do
        @review.hotel_type_id = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('宿泊タイプを選択して下さい')
      end

      it 'hotel_type_idが1を場合投稿できない' do
        @review.hotel_type_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('宿泊タイプを選択して下さい')
      end

      it 'grade_idが空の場合投稿できない' do
        @review.grade_id = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('学年を選択して下さい')
      end

      it 'grade_idが1の場合投稿できない' do
        @review.grade_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('学年を選択して下さい')
      end

      it 'season_idが空の場合投稿できない' do
        @review.season_id = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('季節を選択して下さい')
      end

      it 'season_idが1の場合投稿できない' do
        @review.season_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('季節を選択して下さい')
      end

      it 'region_idが空の場合投稿できない' do
        @review.region_id = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('施設所在地を選択して下さい')
      end

      it 'region_idが1の場合投稿できない' do
        @review.region_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('施設所在地を選択して下さい')
      end

      it 'student_count_idが空の場合投稿できない' do
        @review.student_count_id = ''
        @review.valid?
        expect(@review.errors.full_messages).to include('生徒人数を選択して下さい')
      end

      it 'student_count_idが1の場合投稿できない' do
        @review.student_count_id = 1
        @review.valid?
        expect(@review.errors.full_messages).to include('生徒人数を選択して下さい')
      end

      it 'textが140文字以上だと投稿できない' do
        @review.text = 'テストです' * 140
        @review.valid?
        expect(@review.errors.full_messages).to include('感想は140文字以内で入力してください')
      end


    end
  end
end
