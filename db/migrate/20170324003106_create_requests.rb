class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :hospital
      t.string :department
      t.string :comment
      t.date :appointment

      t.timestamps null: false
    end
  end
end
