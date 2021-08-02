class LikesController < ApplicationController
  before_action :set_review

  def create
    @like = Like.cretate(user_id: current_user.id, review_id: review.id)
  end

  def destroy
    @like = current_user.liles.find_by(review_id: @review.id)
  end

  private

  def set_review
    @review = Review.find(params[:review_id])
  end
end
