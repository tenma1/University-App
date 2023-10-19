class ReceiptsController < ApplicationController
  def index
    @receipts = Receipt.all
  end

  def show
    @receipt = current_user.receipts.find(params[:id])
  end
end
