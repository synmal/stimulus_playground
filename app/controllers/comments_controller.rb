class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    render partial: 'new'
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params)
    render json: comment
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
