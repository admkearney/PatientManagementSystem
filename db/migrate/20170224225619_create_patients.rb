class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.text :address
      t.integer :phone
      t.string :infection
      t.string :injury
      t.text :observation

      t.timestamps null: false
    end
  end
end
