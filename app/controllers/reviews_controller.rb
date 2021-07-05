class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path
     else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:faclity_name, :hotel_type_id, :grade_id, :season_id, :region_id, :student_count_id, :price, :text, :safety, images: []).merge(user_id: current_user.id)
  end

end
