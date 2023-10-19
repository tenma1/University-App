class CreateReceipts < ActiveRecord::Migration[7.0]
  def change
    create_table :receipts do |t|
      t.integer :amount
      t.datetime :date_time
      t.string :status
      t.string :payment_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
