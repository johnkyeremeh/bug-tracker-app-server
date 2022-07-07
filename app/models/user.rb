class User < ApplicationRecord
   # adds methods to set and authenticate against BCrypt password. #.authenticate(password)
    has_secure_password
    
    # Ensure each user is unique username and unique email

    validates :email, :username, presence: true
    validates :username, :email, uniqueness: true 

end
