class Course < ApplicationRecord
  has_and_belongs_to_many :users

  validates :course_name, :course_credit, presence: true
  validates :course_code, presence: true, uniqueness: true

  # limit no of objects in has many associations (User + Courses)
  # # validates_associated :users
  # LIMIT = 2

  # validates_on_create do |record|
  #   record.validate_quota
  # end

  # def validate_quota
  #   # return unless self.user    # commented because there can be courses will be there even without students
  #   if self.user.courses(:reload).count >= LIMIT
  #     errors.add(:base, :exceeded_quota)
  #   end
  # end

end
