class Schedule < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '今日だけ' },
    { id: 2, name: '毎日' },
    { id: 3, name: '毎週' },
  ]

  include ActiveHash::Associations
  has_many :tasks
  end

