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
    @user.user_pending_validation!

    if @user.save
      factor = FactorValidation.new
      factor.user = @user
      factor.ttl = 1.days.from_now.getutc
      factor.factor_pending_validation!
      factor.save

      application_url = ENV["APPLICATION_URL"]
      activation_path = "/account/activate/"
      activation_link = "#{application_url}#{activation_path}#{factor.id}"

      UserMailer.with(user: @user, activation_link: activation_link).account_activation.deliver_now

      respond_to do |format|
        format.html { redirect_to login_url, status: :ok, notice: "Please confirm the email in your inbox" }
      end
    else
      render :new, status: :unprocessable_entity
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

    if factor.factor_pending_validation?
      factor.validated_factor!
      factor.user.active_user!

      factor.user.save
      factor.save

      session[:user_id] = factor.user.id

      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: "Your account was validated."}
      end
    elsif factor.validated_factor? && factor.ttl > Time.now.getutc
      respond_to do |format|
        format.html { redirect_to login_url, alert: "This link is already activated"}
      end
    else
      respond_to do |format|
        format.html { redirect_to login_url, alert: "This link is invalid"}
      end
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password)
  end

  def require_same_user
    unless current_user != @user
      respond_to do |format|
        format.html { redirect_to current_user, status: 302, alert: "You can only edit or delete your own profile" }
      end
    end
  end

end
