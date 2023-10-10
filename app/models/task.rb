class Task < ApplicationRecord

  belongs_to :user
  belongs_to :family
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status


end
