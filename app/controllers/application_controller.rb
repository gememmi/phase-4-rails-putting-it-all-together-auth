class ApplicationController < ActionController::API
include ActionController::Cookies

rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

private
  
  def authorize
    @current_user = User.find_by(id: session[:user_id])

    render json:{errors: "Not Authorized"}, status: :unauthorized, unless @current_user
  end
end

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end


end
