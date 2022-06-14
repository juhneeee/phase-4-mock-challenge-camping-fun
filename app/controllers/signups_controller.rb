class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :invalid


    def create
        signup = Signup.create!(signup_params)
        render json: Activity.find(params[:activity_id]), status: 201
    end

    private
    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
    def invalid
        render json: {errors: ["validation errors"], status: 422}, status: 422
    end
end
