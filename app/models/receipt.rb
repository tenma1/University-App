class Receipt < ApplicationRecord
  belongs_to :user

  # Receipts are created in UsersController on successful completion of OrderPayment.
end
