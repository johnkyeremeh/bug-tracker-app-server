class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :summary
      t.string :description
      t.string :status 
      t.string :priority 
      t.references :user, polymorphic: true, index: true
      # t.references :project,polymorphic: true, index: true

      t.timestamps
    end
  end
end
