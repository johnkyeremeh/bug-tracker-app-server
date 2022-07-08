class ProjectSerializer
  include JSONAPI::Serializer
  attributes :title, :description
  
  belongs_to :user
  has_many :bugs
end
