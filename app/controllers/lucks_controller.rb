class LucksController < ApplicationController
    before_action :set_luck, only: [:show, :edit, :update, :destroy,]
    before_action :user_blank, only: [:show, :edit, :new,:destroy]
    before_action :edit_destroy_postonly, only: [:edit,:destroy]
    
    def index
      @luck = Luck.all
    end
    
    def new
      @luck = Luck.new
    end
    
    def create
      @luck = Luck.new(luck_params)
      @luck.user_id = current_user.id
      if @luck.save
        redirect_to lucks_path, notice: "投稿完了しました。"
      else
        render 'new'
      end
    end
    
    def update
      if @luck.update(luck_params)
        redirect_to lucks_path, notice: "編集しました！"
      else
        render 'edit'
      end
    end
    
    def show
      @luck = Luck.find(params[:id])
    end
    
    def edit
       @luck = Luck.find(params[:id])
    end
    
    def destroy
    @luck.destroy
      redirect_to lucks_path, notice:"削除しました！"
    end
    
    def confirm
    @luck = Luck.new(luck_params)
   
    end
    
    private
    
    def set_luck
      @luck = Luck.find(params[:id])
    end

    def luck_params
    params.require(:luck).permit(:content, :image, :image_cache, :user_id)
    end
    
    def user_blank
    if current_user.blank?
       redirect_to new_user_registration_path
      #間違えているかも
    end
    end
    
    def edit_destroy_postonly
    unless @luck.user_id == current_user.id
      redirect_to lucks_path, notice:"投稿者以外の編集、削除はできません。"
    end
    end
end
