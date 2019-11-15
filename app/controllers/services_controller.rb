class ServicesController < ApplicationController
  def show
    @service = Service.find_by id: params[:id]
    @service_reviews = @service.service_reviews.order('created_at DESC').page(params[:page]).per(Settings.page.num_of_reviews)
    redirect_to root_url if @service.nil?
  end
end
