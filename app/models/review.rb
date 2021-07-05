class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hotel_type
  belongs_to :grade
  belongs_to :season
  belongs_to :region
  belongs_to :student_count

  has_many_attached :images

end
