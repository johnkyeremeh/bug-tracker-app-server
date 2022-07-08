class BugSerializer
  include JSONAPI::Serializer
  attributes :title, :description

  belongs_to :project
  belongs_to :user 
end
