class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_like

  def create
    user = current_user
    review = Review.find(params[:review_id])
    like = Like.create(user_id: user.id, review_id: review.id)
  end

  def destroy
    user = current_user
    review = Review.find(params[:review_id])
    like = Like.find_by(user_id: user.id, review_id: review.id)
    like.destroy
  end

  private

  def set_like
    @review = Review.find(params[:review_id])
  end
end
