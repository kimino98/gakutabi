class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
     else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    comment = @review.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      redirect_back(fallback_location: root_path)
    else
      render "review/show"
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
