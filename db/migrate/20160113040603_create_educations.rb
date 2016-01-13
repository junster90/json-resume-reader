class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
    	t.string :qualification
    	t.string :school
    	t.string :year
    	t.references :profile, null: false
      t.timestamps null: false
    end
  end
end
