class Academic < ApplicationRecord
  belongs_to :user
  has_one_attached :academic_calender
  has_one_attached :time_table
  has_many_attached :exam_results
  has_many_attached :academic_histories
end
