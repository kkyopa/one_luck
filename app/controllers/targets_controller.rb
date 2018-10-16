class TargetsController < ApplicationController
  before_action :set_target, only: [:show, :edit, :update, :destroy,]
  
    def top
      @target = Target.find_by(user_id: current_user.id)
    end
    
    def index
      @target = Target.all
    end
    
    def new
      @target = Target.new
    end
    
    def create
      @target = Target.new(target_params)
      @target.user_id = current_user.id
      if @target.save
        redirect_to targets_path, notice: "投稿完了しました。"
      else
        render 'new'
      end
    end
    
    def show
      # @target= Target.find(params[:id])
      @target = Target.find_by(user_id: current_user.id)
      # binding.pry
    end
    
    def edit
      @target= Target.find(params[:id])
    end
    
    def update
      if @target.update(target_params)
        redirect_to target_path, notice: "編集しました！"
      else
        render 'edit'
      end
    end
    
    private
    
    def set_target
      @target = Target.find(params[:id])
    end
    
    def target_params
    params.require(:target).permit(:point, :content, :image, :image_cache, :user_id, :luck_id)
    end
end


