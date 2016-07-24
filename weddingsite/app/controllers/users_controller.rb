class UsersController < ApplicationController
  before_action :require_user, only: [:index, :show]
  def index
    @users = User.all
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.pic = params[:file]
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :pic)
  end
end
