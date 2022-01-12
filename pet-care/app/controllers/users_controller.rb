class UsersController < ApplicationController

  before_action :require_user, except: [:new, :create]
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

      format.html { redirect_to login_url, notice: "Please confirm the email in your inbox" }
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
