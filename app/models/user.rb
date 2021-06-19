class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :profession

  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message:'は半角英数字を両方含む6文字にして下さい' }
    validates :company_name
    validates :profession_id, numericality: { other_than: 1, message: 'を選択して下さい'}
  end
end
