class CreateJoinTableHostelNewsLetter < ActiveRecord::Migration[7.0]
  def change
    create_join_table :hostels, :news_letters do |t|
      # t.index [:hostel_id, :news_letter_id]
      # t.index [:news_letter_id, :hostel_id]
    end
  end
end
