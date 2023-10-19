class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # include DeviseInvitable::Inviter
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
