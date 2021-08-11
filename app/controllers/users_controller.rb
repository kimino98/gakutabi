class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    
    @reviews = @user.reviews.page(params[:page]).per(10).order('updated_at DESC')
    @likes = Like.where(user_id: @user.id)
  end

  def edit
    
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = '編集に成功しました'
      redirect_to user_path(current_user)
     else
      flash[:alert] = '編集に失敗しました'
      redirect_to edit_user_path(current_user)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nickname, :email, :company_name, :profession_id, :image)
    end
end
