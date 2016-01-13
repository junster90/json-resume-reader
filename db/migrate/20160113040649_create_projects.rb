class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :name
    	t.string :description
    	t.string :url
    	t.references :profile, null: false
      t.timestamps null: false
    end
  end
end
