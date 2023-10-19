class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.integer :course_code
      t.integer :course_credit

      t.timestamps
    end
  end
end
