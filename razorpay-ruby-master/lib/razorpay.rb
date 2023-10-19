require 'razorpay/card'
require 'razorpay/order'
require 'razorpay/errors'
require 'razorpay/refund'
require 'razorpay/invoice'
require 'razorpay/payment'
require 'razorpay/utility'
require 'razorpay/customer'
require 'razorpay/constants'
require 'razorpay/collection'
require 'razorpay/virtual_account'
require 'razorpay/plan'
require 'razorpay/subscription'
require 'razorpay/addon'
require 'razorpay/transfer'
require 'razorpay/subscription_registration'
require 'razorpay/settlement'
require 'razorpay/payment_link'
require 'razorpay/fund_account'
require 'razorpay/item'
require 'razorpay/qr_code'
require 'razorpay/payment_method'

# Base Razorpay module
# module Razorpay
#   class << self
#     attr_accessor :auth, :custom_headers
#   end

#   def self.setup(key_id, key_secret)
#     self.auth = { username: key_id, password: key_secret }
#   end

#   def self.headers=(headers = {})
#     self.custom_headers = headers
#   end
# end


module Razorpay
  # class << self
  #   attr_accessor :auth, :custom_headers
  # end

  def setup
    Razorpay.setup(ENV['KEY_ID'], ENV['SECRET_KEY'])
  end

  def self.headers=(headers = {})
    self.custom_headers = headers
  end
end
