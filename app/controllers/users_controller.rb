class UsersController < ApplicationController
    skip_before_action :authorize, only :create

    def create 
        user = User.create!(user_params)
        if user.valid?
        session[:id]= user.id
        render json: user, status: :created
        else  
            render json: {errors.errors.full_messages }, status: :unprocessable_entity
        end

    end

    def show 
      render json: @current_user
    end

    privates
    def user_params
        params.permit(:username, :image_url, :password_digest, :bio)
    end


end


# In the create action, if the user is valid:
# Save a new user to the database with their username, encrypted password, image URL, and bio
# Save the user's ID in the session hash
# Return a JSON response with the user's ID, username, image URL, and bio; and an HTTP status code of 201 (Created)
# If the user is not valid:
# Return a JSON response with the error message, and an HTTP status code of 422 (Unprocessable Entity)


# In the show action, if the user is logged in (if their user_id is in the session hash):
# Return a JSON response with the user's ID, username, image URL, and bio; and an HTTP status code of 201 (Created)
# If the user is not logged in when they make the request:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)

 