class Profession < ActiveHash::Base
  self.date = [
    { id: 1, name: '--'},
    { id: 2, name: '小学校教諭'},
    { id: 3, name: '中学校教諭'},
    { id: 4, name: '高等学校教諭'},
    { id: 5, name: '特別支援学校教諭'},
    { id: 6, name: '旅行会社'},
  ]
end
