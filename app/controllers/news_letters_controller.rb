class NewsLettersController < ApplicationController
  def index
    @all_letters = NewsLetter.all
  end

  def show
    @letter = NewsLetter.find(params[:id])
  end
  
end
