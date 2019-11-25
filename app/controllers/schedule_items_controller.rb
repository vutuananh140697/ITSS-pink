class ScheduleItemsController < ApplicationController
    before_action :load_user, only: %i(index)
    def index
        @schedules = @user.schedules.order(created_at: :desc)
        @schedule = Schedule.find_by id: params[:schedule_id]
        @schedule_items = @schedule.schedule_items.order(created_at: :desc)
    end
    
    def load_user
        @user = User.find_by id: params[:user_id]
        return if @user
        flash[:danger] = t "flash.danger.user_not_found"
        redirect_to root_path
    end
    def destroy
        @schedule_item_id = params[:id]
        @item = ScheduleItem.find_by id: params[:id]
        @item.destroy
        respond_to do |format|
          format.html
          format.js
        end
    end
    
    def create
        @schedule = Schedule.find_by(id: params[:schedule_id])
        @schedule_item = @schedule.schedule_items.build schedule_item_params
        @schedule_item.save
        respond_to do |format|
            format.html
            format.js
        end
    end
    def schedule_item_params
        params.require(:schedule_item).permit(:category_name, :description)
    end
end