class AddPatientIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :patient_id, :integer
  end
end
