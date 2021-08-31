class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :profession

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  
  #投稿写真
  has_one_attached :avatar
  #コメント機能
  has_many :conmments
  #いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review

  #バリデーション
  with_options presence: true do
    validates :nickname, length: { maximum: 10 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message:'は半角英数字を両方含む6文字にして下さい' }
    validates :company_name, length: { maximum: 50 }
    validates :profession_id, numericality: { other_than: 1, message: 'を選択して下さい'}
  end
    validates :profile, length: { maximum: 100}

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64(8)
      user.nickname = 'ゲスト'
      user.company_name = 'ゲスト中学校'
      user.profession_id = 2
    end
  end
end
