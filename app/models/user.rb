class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :profession

  validates :profession_id, numericality: { other_than: 1 }
end
