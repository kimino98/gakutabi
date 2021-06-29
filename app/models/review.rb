class Review < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :hotel_type
  belongs_to :grade
  belongs_to :season

end
