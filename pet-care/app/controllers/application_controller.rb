class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    if session
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    unless logged_in?
      respond_to do |format|
        format.html { redirect_to login_url, status: :unprocessable_entity, alert: "You must be logged in to perform this operation." }
      end
    end
  end

  def redirect_with_notice(to, status, message)
    respond_to do |format|
      format.html { redirect_to to, status: status, notice: message }
    end
  end

  def redirect_with_alert(to, status, message)
    respond_to do |format|
      format.html { redirect_to to, status: status, alert: message }
    end
  end

end
