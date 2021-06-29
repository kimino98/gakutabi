class Grade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '小学1年生' },
    { id: 3, name: '小学2年生' },
    { id: 4, name: '小学3年生' },
    { id: 5, name: '小学4年生' },
    { id: 6, name: '小学5年生' },
    { id: 7, name: '小学6年生' },
    { id: 8, name: '小学校特別支援学級' },
    { id: 9, name: '中学1年生' },
    { id: 10, name: '中学2年生' },
    { id: 11, name: '中学3年生' },
    { id: 12, name: '中学校特別支援学級' },
    { id: 13, name: '高校1年生' },
    { id: 14, name: '高校2年生' },
    { id: 15, name: '高校3年生' },
    { id: 16, name: '高等学校特別支援学級' },
    { id: 17, name: '部活合宿' },
    { id: 18, name: '勉強合宿' },
    { id: 19, name: '大学ゼミ合宿' },
    { id: 20, name: '大学サークル合宿' },
    { id: 21, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :reviews
end