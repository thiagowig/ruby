class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        notice = "Logged in successfully"
        format.html { redirect_to user_url(user), notice: "Logged in successfully." }
        format.json { render :show, status: :ok, location: user }
      else
        format.html { render :new, notice: "Logged in successfully." }
      end
    end
  end

  def destroy
  end

end
