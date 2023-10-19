class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :amount
      t.integer :status
      t.string :razorpay_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
