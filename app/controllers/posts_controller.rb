class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :check_authorization, only: [:create, :new, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def show
    @comments = @post.comments
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params[:post].permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def check_authorization
    authenticate_user! unless current_user
    redirect_to posts_path, notice: 'Nie weszłeś!' unless current_user.is_admin?
  end
end
