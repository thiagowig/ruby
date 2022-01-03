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

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
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
