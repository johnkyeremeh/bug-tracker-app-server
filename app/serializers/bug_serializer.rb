class BugSerializer 
  include FastJsonapi::ObjectSerializer
  attributes :summary, :description, :status, :priority, :user, :project, :created_at

  belongs_to :project, serializer: ProjectSerializer
  belongs_to :user, serializer: UserSerializer
end
