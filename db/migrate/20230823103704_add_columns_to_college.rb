class AddColumnsToCollege < ActiveRecord::Migration[7.0]
  def up
    add_column :colleges, :address, :string
    add_column :colleges, :discipline, :string
    add_column :colleges, :pincode, :integer
    add_column :colleges, :city, :string
  end

  def down
    remove_column :colleges, :city
    remove_column :colleges, :pincode
    remove_column :colleges, :discipline
    remove_column :colleges, :address
  end
  
end
