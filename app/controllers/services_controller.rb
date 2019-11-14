class ServicesController < ApplicationController
  def show
    @service = Service.find_by id: params[:id]
    redirect_to root_url if @service.nil?
  end
end
