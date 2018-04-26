class PostsController < ApplicationController

    before_action except: :show do
      if @current_user.nil?
        redirect_to sign_in_path, notice: "Please Sign in"
      end
    end

    def home
      @posts = Post.all.order("vote desc")
    end

    def feed
      @posts = @current_user.timeline
    end

    def index
      @posts = Post.where user_id: @current_user.id
    end

    def show
      @post = Post.find_by id: params[:id]
      @comment = Comment.new
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new
      @post.title = params[:post][:title]
      @post.url = params[:post][:url]
      @post.author = @current_user.username
      @post.user = @current_user
      if @post.save
        redirect_to post_path(id: @post.id)
      else
        render :new
      end
    end

    def delete
      Post.find(params[:id]).destroy
      redirect_to root_path
    end

    def positive_vote
      @post = Post.find_by id: params[:id]
      @post.vote += 1
      if @post.save
        redirect_to root_path
      else
        render :index
      end
    end

    def negative_vote
      @post = Post.find_by id: params[:id]
      @post.vote -= 1
      if @post.save
        redirect_to root_path
      else
        render :index
      end
    end
end
