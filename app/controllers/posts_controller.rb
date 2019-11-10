class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
     @post = Post.find(params[:id])
  end

  def update
    Post.update(params[:id], post_params)
    redirect_to post_path
  end

  def create
    Post.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end
end
