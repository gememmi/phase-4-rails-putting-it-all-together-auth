class SessionsController < ApplicationController

    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id]= user.id 
            render json: user
        else 
            render json: {error: "Invalid username or password"}, status: :unauthorized
    end
end


# In the create action, if the user's username and password are authenticated:
# Save the user's ID in the session hash
# Return a JSON response with the user's ID, username, image URL, and bio
# If the user's username and password are not authenticated:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)

# Basically, this is giving our user, who has already created an accoubt, the ability to LOG BACK IN TO THE ACCOUNT, this is a POST to /login in our routes