class AddColumnsToTables < ActiveRecord::Migration[7.0]
  def up
    add_column :colleges, :fee, :integer
    add_column :schools, :fee, :integer
    add_column :hostels, :fee, :integer
    add_column :courses, :fee, :integer
    add_column :receipts, :details, :string
    remove_column :receipts, :date_time
    remove_column :orders, :razorpay_id
    remove_column :accountings, :razorpay_order_id
  end

  def down
    add_column :accountings, :razorpay_order_id, :integer
    add_column :orders, :razorpay_id, :string
    add_column :receipts, :date_time, :datetime
    remove_column :receipts, :details
    remove_column :courses, :fee
    remove_column :hostels, :fee
    remove_column :schools, :fee
    remove_column :colleges, :fee
  end
end
