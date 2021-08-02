class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy, :show, :edit, :update]

  def index
    @reviews = Review.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @like = Like.new
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
    @comments = @review.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @review.update(review_params)
      flash[:notice] = '編集に成功しました'
      redirect_to root_path
     else
      flash[:alert] = '編集に失敗しました'
      render :edit
    end
  end

  private
  def review_params
    params.require(:review).permit(:faclity_name, :hotel_type_id, :grade_id, :season_id, :region_id, :student_count_id, :price, :text, :safety, images: []).merge(user_id: current_user.id)
  end

  def set_review
    @review = Review.find(params[:id])
  end

end
