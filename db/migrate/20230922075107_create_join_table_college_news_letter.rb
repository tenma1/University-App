class CreateJoinTableCollegeNewsLetter < ActiveRecord::Migration[7.0]
  def change
    create_join_table :colleges, :news_letters do |t|
      # t.index [:college_id, :news_letter_id]
      # t.index [:news_letter_id, :college_id]
    end
  end
end
