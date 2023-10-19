class Accounting < ApplicationRecord
  belongs_to :user

  # limit no of objects in has_many/has_one associations (User + Courses)
  validates_associated :user
  validate :validate_quota, on: :create
  # LIMIT = 2

  # validates_on_create do |record|
  #   record.validate_quota
  # end

  def validate_quota
    return unless self.user    # commented because there can be courses will be there even without students
    if self.user.accounting(:reload).count >= 1
      errors.add(:base, :exceeded_quota)
    end
  end

end
