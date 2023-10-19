class OrdersController < ApplicationController

  def payments_online
    amount = current_user.accounting.current_due + current_user.accounting.other_charges
    if amount != 0
      current_user.build_order(status: 1, amount: amount).save!
      @order = current_user.order
      ::Razorpay.setup(ENV['KEY_ID'], ENV['SECRET_KEY'])
      Payment::RazorpayPayment.create_payment(current_user.order)
    else
      @order = 0
    end
  end

  # def new
  #   amount = current_user.accounting.current_due + current_user.accounting.other_charges
  #   current_user.build_order(status: 1, amount: amount).save!
  #   @order = current_user.order
  #   ::Razorpay.setup(ENV['KEY_ID'], ENV['SECRET_KEY'])
  #   ord = Order.new(amount: total_amount)
  #   @razorpay_order = Payment::RazorpayPayment.create_payment(@order)
  #   payment_response = {
  #       razorpay_order_id: 'order_IEIaMR65cu6nz3',
  #       razorpay_payment_id: 'pay_IH4NVgf4Dreq1l',
  #       razorpay_signature: '0d4e745a1838664ad6c9c9902212a32d627d68e917290b0ad5f08ff4561bc50f'
  #     }
  #       Razorpay::Utility.verify_payment_signature(payment_response)
  # end

  # def new
  #   total_amount = current_user.accounting.current_due + current_user.accounting.other_charges
  #   order = Order.new(amount: total_amount)
  #   razorpay_order = Payment::RazorpayPayment.create_payment(current_user.order)
  # end

end
