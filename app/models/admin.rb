class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :registerable, :omniauthable
  devise :database_authenticatable, :recoverable,  :validatable
end
