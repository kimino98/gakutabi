class Profession < ActiveHash::Base
  self.date = [
    { id : 1, name: '--' },
    { id : 2, name: '小学校教諭' },
    { id : 3, name: '中学校教諭' },
    { id : 4, name: '高校教諭' },
    { id : 5, name: '特別支援学校教諭' },
    { id : 6, name: '旅行業界' },
    { id : 7, name: '宿泊業界' },
    { id : 8, name: '観光業界' }
  ]
end