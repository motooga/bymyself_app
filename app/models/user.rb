class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:nickname] 

  validates :nickname, presence: true, uniqueness: true 
  validates :user_points, presence: true, uniqueness: true 
  belongs_to :family
  has_many :tasks
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
