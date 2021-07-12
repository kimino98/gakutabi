class HotelType < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '宿泊施設ではない' },
    { id: 3, name: 'ホテル' },
    { id: 4, name: '旅館' },
    { id: 5, name: 'コテージ' },
    { id: 6, name: 'メゾネット' },
    { id: 7, name: 'アネックス' },
    { id: 8, name: '民泊' },
    { id: 9, name: 'キャンプ' },
    { id: 10, name: '農家民泊' },
    { id: 11, name: '国民宿舎' },
    { id: 12, name: '休暇村' },
    { id: 13, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :reviews
end