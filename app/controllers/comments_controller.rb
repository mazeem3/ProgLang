class CommentsController < ApplicationController

  before_action except: :show do
    if @current_user.nil?
      redirect_to sign_in_path, notice: "Please Sign in"
    end
  end

  def show
    @comment = Comment.find_by id: params[:id]
  end

  def create
    @post = Post.find_by id: params[:id]
    @comment = Comment.new
    @comment.body = params[:comment][:body]
    @comment.author = @current_user.username
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(id: @post.id)
    end
  end

  def new
    @comment = Comment.new
  end

  def delete
    Comment.find(params[:id]).destroy
    redirect_to root_path
  end

end
