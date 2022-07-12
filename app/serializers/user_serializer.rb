class UserSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :username, :email

  has_many  :projects, serializer: ProjectSerializer
  has_many :bugs, serializer: BugSerializer
end
