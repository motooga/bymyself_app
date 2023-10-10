class Category < ActiveHash::Base
  self.data = {
    id: 0, name: ''
    id: 1, name: ''
    id: 2, name: ''
  }

  inclide ActiveHash::Associations
  has_many :tasks
end