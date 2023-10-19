class CreateAccountings < ActiveRecord::Migration[7.0]
  def change
    create_table :accountings do |t|
      t.integer :total_value
      t.integer :current_due
      t.integer :credited
      t.string :other_details
      t.integer :other_charges
      t.string :details
      t.integer :razorpay_order_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
