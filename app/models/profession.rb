class Profession < ActiveHash::Base
  self.data = [
    { id: 1, name: '選択して下さい' },
    { id: 2, name: '小学校教諭' },
    { id: 3, name: '中学校教諭' },
    { id: 4, name: '高校教諭' },
    { id: 5, name: '特別支援学校教諭' },
    { id: 6, name: '旅行業界' },
    { id: 7, name: '宿泊業界' },
    { id: 8, name: '観光業界' }
  ] 
    include ActiveHash::Associations
    has_many :users
end
  
  