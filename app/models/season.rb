class Season < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '春' },
    { id: 3, name: '夏' },
    { id: 4, name: '秋' },
    { id: 5, name: '冬' },
  ] 
    include ActiveHash::Associations
    has_many :reviews
end