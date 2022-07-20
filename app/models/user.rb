class User < ApplicationRecord
   # adds methods to set and authenticate against BCrypt password. #.authenticate(password)
    has_secure_password
    
    has_many :projects
    has_many :bugs
    accepts_nested_attributes_for :projects, reject_if: :all_blank
    accepts_nested_attributes_for :bugs, reject_if: :all_blank
    
    # Ensure each user is unique username and unique email

    validates :email, :username, presence: true
    validates :username, :email, uniqueness: true 

end
