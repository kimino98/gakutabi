class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
     else
      redirect_back(fallback_location: root_path)
    end
  end



  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, review_id: params[:review_id])
  end
end
