class HomeController < ApplicationController
  def index
  end
  
  def search
    if params[:name].blank? 
      # && params[:start_date].blank? && params[:end_date].blank?
      redirect_to root_path
    else
      @places = Place.get_places(params[:name])
    end
  end
end
