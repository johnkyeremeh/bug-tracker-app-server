class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email

  has_many :projects
  has_many :bugs
end
