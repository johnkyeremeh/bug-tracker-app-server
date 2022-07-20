class ProjectSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :bugs
  
  belongs_to :user, serializer: UserSerializer
  has_many :bugs, serializer: BugSerializer
end
