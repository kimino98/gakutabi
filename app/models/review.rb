class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hotel_type
  belongs_to :grade
  belongs_to :season
  belongs_to :region
  belongs_to :student_count

  belongs_to :user
  has_many_attached :images
  #コメント機能アソシエーション処理
  has_many :comments
  #いいね機能アソシエーション処理
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  #投稿バリデーション
  with_options presence: true do
    validates :faclity_name, length: { maximum: 40 }
    validates :images
    validates :price, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
    
    with_options length: { maximum: 140 } do
      validates :text
      validates :safety
    end
    
    with_options numericality: { other_than: 1,  message: 'を選択してください' } do
      validates :hotel_type_id
      validates :grade_id
      validates :season_id
      validates :region_id
      validates :student_count_id
    end
  end
  
end
