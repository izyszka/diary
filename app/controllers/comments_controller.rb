class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.build(comment_params)
    comment.user_id = current_user.id

    comment.save

    redirect_to post_path(post)
  end

  private

  def comment_params
    params[:comment].permit(:body)
  end
end
