require 'razorpay'
module Payment
  class RazorpayPayment
    class << self
      def create_payment(order)
        total_due = (order.amount)*100
        order = ::Razorpay::Order.create amount: total_due, currency: 'INR', receipt: 'TEST'
      end
    end
  end
end
