class Project < ApplicationRecord
    belongs_to :user
    has_many :bugs    
    accepts_nested_attributes_for :bugs, reject_if: :all_blank

    validates :title, presence: true
    validates :description, presence: true
    validates :user, presence: true
end
