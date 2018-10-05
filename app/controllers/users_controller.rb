class UsersController < ApplicationController
    def index
        
    end
    
    def edit
    end
    
    def show
      @user = User.find(params[:id])
      # @target = Target.find_by(user_id: current_user.id)
      @target = current_user.targets.order(updated_at: :desc).first
      # orderで並び替え
      #降順にする場合は”DESC” 昇順は”ASC”
      @luck = Luck.all
    end
   
    
    private
    
    # def user_params
    #   params.require(:user).permit(:avatar, :avatar_cache)
    # end
end


