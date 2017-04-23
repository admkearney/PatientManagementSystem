class AddClinicIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :clinic_id, :integer
  end
end
