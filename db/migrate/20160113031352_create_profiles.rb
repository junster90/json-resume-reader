class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.string :name
    	t.string :phone
    	t.string :email
    	t.string :street
    	t.string :city
    	t.string :postcode
    	t.string :state
    	t.string :image
    	t.text :about
    	t.string :languages, array: true, default: []

      t.timestamps null: false
    end
  end
end
