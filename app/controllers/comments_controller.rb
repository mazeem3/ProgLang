class CommentsController < ApplicationController
  def create
    @post = Post.find_by id: params[:id]
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.author = params[:comment][:author]
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(id: @post.id)
    end
  end
  def new
    @comment = Comment.new
  end
end
