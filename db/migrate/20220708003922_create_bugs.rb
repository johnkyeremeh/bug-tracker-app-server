class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.string :description
      t.id :user

      t.timestamps
    end
  end
end
