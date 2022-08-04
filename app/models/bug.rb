class Bug < ApplicationRecord
    belongs_to :project
    belongs_to :user 


    validates :summary, presence: true
    validates :description, presence: true
    validates :status, presence: true
    validates :priority, presence: true
    validates :project, presence: true
end
