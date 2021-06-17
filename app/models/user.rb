class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :profession

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX }, 
                      uniqueness: { case_sensitive: false }
    validates :password, format: { with: /\A[a-z0-9]+\z/ }
    validates :company_name
    validates :profession_id, numericality: { other_than: 1 }
  end
end
