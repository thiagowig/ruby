class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        format.html { redirect_to account_url, notice: "Logged in successfully." }
      else
        format.html { redirect_to login_url, status: :unprocessable_entity, alert: "Invalid email or password." }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
