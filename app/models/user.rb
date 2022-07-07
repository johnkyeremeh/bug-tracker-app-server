class User < ApplicationRecord
   # adds methods to set and authenticate against BCrypt password
    has_secure_password
    
    # Ensure each user is unique 
    validates :username, uniqueness: { case_sensitive: false }
    # validates :username,  uniqueness: {case_senitive: false} 
end
