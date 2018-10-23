class UsersController < ApplicationController
  # before_action :set_user, only: [:following, :followers,]

  def index
    @user = User.all
  end
  
  def edit
  end
  
  def show
    @user = User.find(params[:id])
    @target = @user.targets.order(updated_at: :desc).first
    @luck = @user.lucks
    @chart_luck = {"現在のポイント" => @user.lucks.count}
    @chart_target = {"目標ポイント" => @target&.point}
  end
  
  def following
  end
 
  def followers
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
