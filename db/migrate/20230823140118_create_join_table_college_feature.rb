class CreateJoinTableCollegeFeature < ActiveRecord::Migration[7.0]
  def change
    create_join_table :colleges, :features do |t|
      t.index [:college_id, :feature_id]
      # t.index [:feature_id, :college_id]
    end
  end
end
