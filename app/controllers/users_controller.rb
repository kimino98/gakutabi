class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @reviews = @user.reviews.page(params[:page]).per(10).order('updated_at DESC')
    @likes = Like.where(user_id: @user.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
       bypass_sign_in(@user)
       redirect_to user_path(@user)
    else
       render :edit
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :company_name, :profile, :profession_id, :avatar)
    end

    def ensure_correct_user
      redirect_to user_path(@user) unless @user.id == current_user.id
    end
end
