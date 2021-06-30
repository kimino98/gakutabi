class Student_count < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '1人〜10人' },
    { id: 3, name: '11人〜50人' },
    { id: 4, name: '51人〜100人' },
    { id: 5, name: '101人〜150人' },
    { id: 6, name: '151人〜200人' },
    { id: 7, name: '201人〜250人' },
    { id: 8, name: '251人〜300人' },
    { id: 9, name: '301人〜350人' },
    { id: 10, name: '351人〜400人' },
    { id: 11, name: '401人〜450人' },
    { id: 12, name: '451人〜500人' },
    { id: 13, name: '501人以上' }
  ]

  include ActiveHash::Associations
  has_many :reviews
end