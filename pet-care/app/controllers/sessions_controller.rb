class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|

      if authenticate_user(user)
        session[:user_id] = user.id
        format.html { redirect_to dashboard_path}

      elsif is_user_pending_validation(user)
        format.html { redirect_to login_path, status: :unprocessable_entity, flash: generate_flash("warning", "You have to validate your email") }

      else
        format.html { redirect_to login_path, status: :unprocessable_entity, flash: generate_flash("warning", "Invalid email or password.") }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def is_user_pending_validation(user)
    user&.user_pending_validation?
  end

  def authenticate_user(user)
    user&.active_user? && user.authenticate(params[:session][:password])
  end

end
