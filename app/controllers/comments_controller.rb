class CommentsController < ApplicationController
  def new; end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params.merge(post: @post, user: current_user))

    return if @comment.save

    render :new, status: :unprocessable_entity
  end

  private

  def comment_params = params.require(:comment).permit(:body)
end
