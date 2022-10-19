class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '男の子' },
    { id: 3, name: '女の子' },
    { id: 4, name: '指定なし' }
  ]
  include ActiveHash::Associations
  has_many :pets
end
