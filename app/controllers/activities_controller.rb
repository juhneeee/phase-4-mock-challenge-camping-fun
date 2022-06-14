class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found

    def index
        activities = Activity.all
        render json: activities
    end
    def show
        activity = find_activity
        render json: activity
    end

    def destroy
        activity = find_activity
        activity.destroy
        render json: {status: 200}
    end


    private
    def find_activity
        Activity.find_by!(id: params[:id])
    end
    def not_found
        render json: {message: "Activity not found", status: 404}
    end
end
