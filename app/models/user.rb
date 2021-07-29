class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :profession

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #投稿写真
  has_one_attached :avatar
  #コメント機能
  has_many :conmments
  #いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :review

  #バリデーション
  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message:'は半角英数字を両方含む6文字にして下さい' }
    validates :company_name
    validates :profession_id, numericality: { other_than: 1, message: 'を選択して下さい'}
  end
end
