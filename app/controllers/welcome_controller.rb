class WelcomeController < ApplicationController

  def index
    @colleges = College.all
    @schools = School.all
    @hostels = Hostel.all

    @collection = ['All', 'Colleges', 'Schools', 'Hostels', 'Events']
  end

  def search
    @results = []
    if params[:search_key].blank? or !['All', 'Colleges', 'Schools', 'Hostels', 'Events'].include? params[:search_category]
      redirect_to root_path and return
    end
    @parameter = params[:search_key].downcase
    if params[:search_category].eql?('All')
      ['College', 'School', 'Hostel'].each do |entity|
        @results << entity.constantize.where('lower(name) LIKE ?', "%#{@parameter}%")
      end 
    else
      @results = params[:search_category].singularize.constantize.where('lower(name) LIKE ?', "%#{@parameter}%")
    end
  end

end
