class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :ideas, dependent: :destroy


  ROLES = %w[admin user].freeze

   def admin?      
    self.role == "admin" 
   end 

  def user?  
    self.role == "user"   
  end

end
