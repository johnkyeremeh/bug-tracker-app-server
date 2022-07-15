# class CreateProjects < ActiveRecord::Migration[6.1]
#   def change
#     create_table :projects do |t|
#       t.string :title
#       t.string :description
#       t.references :user, polymorphic: true, index: true
#       t.timestamps
#     end
#   end
# end
