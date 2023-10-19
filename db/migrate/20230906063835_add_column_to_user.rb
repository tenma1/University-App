class AddColumnToUser < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :discipline, :string
    add_column :users, :subject, :string
    add_column :users, :standard, :string
    add_column :users, :institution_type, :string
    add_column :users, :approved, :boolean, default: false
    add_column :users, :contact, :integer

    add_reference :users, :role, foreign_key: true, null: false
    add_reference :users, :college, foreign_key: true
    add_reference :users, :school, foreign_key: true
    add_reference :users, :hostel, foreign_key: true
  end

  def down
    remove_reference :users, :hostel, foreign_key: true
    remove_reference :users, :school, foreign_key: true
    remove_reference :users, :college, foreign_key: true
    remove_reference :users, :role, foreign_key: true

    remove_column :users, :contact
    remove_column :users, :approved
    remove_column :users, :institution_type
    remove_column :users, :standard
    remove_column :users, :subject
    remove_column :users, :discipline
    remove_column :users, :age
    remove_column :users, :name
  end
end
