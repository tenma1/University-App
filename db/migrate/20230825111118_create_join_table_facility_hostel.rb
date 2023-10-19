class CreateJoinTableFacilityHostel < ActiveRecord::Migration[7.0]
  def change
    create_join_table :facilities, :hostels do |t|
      # t.index [:facility_id, :hostel_id]
      # t.index [:hostel_id, :facility_id]
    end
  end
end
