class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable, :timeout_in => 4.hours
         
  has_many :user_avatars, dependent: :destroy
  accepts_nested_attributes_for :user_avatars
  
  has_many :maps, dependent: :destroy
  
  def is_admin?
    is_admin
  end
end
