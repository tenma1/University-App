class CreateAcademics < ActiveRecord::Migration[7.0]
  def change
    create_table :academics do |t|
      t.text :syllabus
      t.integer :att_in_percent
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
