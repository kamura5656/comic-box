class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '状態未選択' },
    { id: 2, name: '未読' },
    { id: 3, name: '所持' },
    { id: 4, name: '既読だが未所持' },
    { id: 5, name: '電子書籍で読了' },
    { id: 6, name: '貸し出し中' }
  ]

  include ActiveHash::Associations
  has_many :boxes
end
