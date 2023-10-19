class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :rating
      t.string :medium
      t.string :affiliation
      t.text :address
      t.string :city
      t.integer :pincode

      t.timestamps
    end
  end
end
