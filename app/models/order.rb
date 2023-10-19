class Order < ApplicationRecord
  belongs_to :user

  enum :status, [:paid, :unpaid, :cancelled]

  # validates :amount, presence: true
  # validates :razorpay_id, presence: true
end