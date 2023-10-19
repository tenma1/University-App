class CreateJoinTableNewsLetterSchool < ActiveRecord::Migration[7.0]
  def change
    create_join_table :news_letters, :schools do |t|
      # t.index [:news_letter_id, :school_id]
      # t.index [:school_id, :news_letter_id]
    end
  end
end
