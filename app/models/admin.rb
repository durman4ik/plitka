class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable,  :validatable, :timeoutable
end
