class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
    	t.string :company
    	t.string :position
    	t.string :year
    	t.references :profile, null: false
      t.timestamps null: false
    end
  end
end
