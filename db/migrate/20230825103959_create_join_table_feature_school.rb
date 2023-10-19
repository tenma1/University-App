class CreateJoinTableFeatureSchool < ActiveRecord::Migration[7.0]
  def change
    create_join_table :features, :schools do |t|
      t.index [:feature_id, :school_id]
      # t.index [:school_id, :feature_id]
    end
  end
end
