class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: "---" },
    { id: 1, name: "みんなのための仕事" },
    { id: 2, name: "じぶんのための仕事" }
  ]

  include ActiveHash::Associations
  has_many :tasks
end