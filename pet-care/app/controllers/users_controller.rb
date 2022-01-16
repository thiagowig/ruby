class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create, :activate_account]
  #before_action :require_same_user, only: [:edit, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if SignupService.call(@user)
      redirect_with_notice(signup_url, :ok, "Please confirm the email in your inbox")

    else
      redirect_with_notice(signup_url, :unprocessable_entity, nil)
    end
  end

  def show
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def activate_account
    factor = FactorValidation.find(params[:token])

    if factor.factor_pending_validation? && factor.ttl > Time.now.getutc
      session[:user_id] = ActivateAccountService.call(factor)
      redirect_with_notice(dashboard_path, :ok, "Your account was validated.")

    elsif factor.validated_factor?
      redirect_with_alert(login_url, :ok, "This link is already activated")

    else
      redirect_with_alert(login_url, :ok, "This link is invalid")
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password, :image)
  end

  def require_same_user
    unless current_user != @user
      respond_to do |format|
        format.html { redirect_to current_user, status: 302, alert: "You can only edit or delete your own profile" }
      end
    end
  end

end
