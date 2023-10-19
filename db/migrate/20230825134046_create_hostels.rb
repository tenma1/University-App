class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :name
      t.integer :capacity
      t.string :residential_type
      t.references :residable, polymorphic: true, null: true

      t.timestamps
    end
  end
end

