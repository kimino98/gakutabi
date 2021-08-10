class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.page(params[:page]).per(10).order('updated_at DESC')
    @likes = Like.where(user_id: @user.id)
  end
end
