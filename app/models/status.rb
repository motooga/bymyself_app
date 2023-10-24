class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: "依頼" },
    { id: 1, name: "完了" },
    { id: 2, name: "承認" }
  ]

  include ActiveHash::Associations
  has_many :tasks
end