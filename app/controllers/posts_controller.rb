class PostsController < ApplicationController
    def index
      @posts = Post.all.order("vote desc")
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
      @post.author = params[:post][:author]
      if @post.save
        redirect_to post_path(id: @post.id)
      else
        render :new
      end
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
