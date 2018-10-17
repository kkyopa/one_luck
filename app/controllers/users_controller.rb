class UsersController < ApplicationController
  # before_action :set_user, only: [:following, :followers,]

    def index
      @user = User.all
    end
    
    def edit
      
    end
    
    def show
      @user = User.find(params[:id])
      # @target = Target.find_by(user_id: current_user.id)
      @target = @user.targets.order(updated_at: :desc).first
      # orderで並び替え
      #降順にする場合は”DESC” 昇順は”ASC”
      # @luck = Luck.all
      # @luck = Luck.where(user_id:@user.id)
      @luck = @user.lucks
      # @user_lucks = @luck.each_with_object [] do |luck, user|
      #   user << luck
      # end
      @chart_luck =  {"現在のポイント" => @user.lucks.count}
      @chart_target =  {"目標ポイント" => @target&.point }
      # @list_lucks = Kaminari.paginate_array(@user_lucks).page(params[:page]).per(5)
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
