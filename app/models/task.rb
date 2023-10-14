class Task < ApplicationRecord

  belongs_to :user
  belongs_to :family
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status
  belongs_to :category
  belongs_to :schedule

  validates :taskname, presence: true
  validates :schedule_id, numericality: { other_than: 0 }

end
