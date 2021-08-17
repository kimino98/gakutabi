class Event < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '修学旅行' },
    { id: 3, name: '林間学校・臨海学校' },
    { id: 4, name: 'スキー教室' },
    { id: 5, name: '校外学習・遠足' },
    { id: 6, name: '部活動合宿' },
    { id: 7, name: 'ゼミ合宿' },
    { id: 8, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :reviews
end