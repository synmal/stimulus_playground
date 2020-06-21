class PostsController < ApplicationController
  def new
    @post = Post.new
    render partial: 'new'
  end

  def create
    post = Post.create(post_params)
    render json: post
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
