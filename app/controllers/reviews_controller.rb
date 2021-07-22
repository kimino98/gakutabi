class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy, :show, :edit]

  def index
    @reviews = Review.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = '投稿に成功しました'
      redirect_to root_path
     else
      flash[:alert] = '投稿に失敗しました'
      render :new
    end
  end

  def destroy
    if @review.destroy
      flash[:notice] = '削除しました'
      redirect_to root_path
     else
      flash[:alert] = '削除に失敗しました'
      redirect_to root_path
     end
  end

  def show
    
  end

  def edit
    
  end

  private
  def review_params
    params.require(:review).permit(:faclity_name, :hotel_type_id, :grade_id, :season_id, :region_id, :student_count_id, :price, :text, :safety, images: []).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
