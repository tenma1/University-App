class CreateNewsLetters < ActiveRecord::Migration[7.0]
  def self.up
    create_table :news_letters do |t|
      t.string :title
      t.integer :post_no
      t.string :brief_info
      t.text :detailed_info

      t.timestamps
    end
  end

  def self.down
    drop_table :news_letters
  end
end
