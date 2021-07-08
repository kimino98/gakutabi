class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hotel_type
  belongs_to :grade
  belongs_to :season
  belongs_to :region
  belongs_to :student_count

  belongs_to :user
  has_many_attached :images

  with_options presence: true do
    validates :faclity_name, length: { maximum: 40 }
    validates :images
    validates :price, format: { with: /\A[0-9]+\z/ }
    
    with_options length: { maximum: 140 } do
      validates :text
      validates :safety
    end
    
    with_options numericality: { other_than: 1,  message: 'を選択して下さい' } do
      validates :hotel_type_id
      validates :grade_id
      validates :season_id
      validates :region_id
      validates :student_count_id
    end
  end
end
