class BugSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :status, :priority

  # belongs_to :project, serializer: ProjectSerializer
  belongs_to :user, serializer: UserSerializer
end
