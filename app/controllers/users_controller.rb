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
      @luck = Luck.all
    end
    
    def following
      
    end
   
    def followers
      
    end
    
    private
    
    def set_user
      # @user = User.find(params[:id])
    end
    
     #def user_params
      #params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
     #end
end


