class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.save

    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params[:comment].permit(:nick, :body)
  end
end
