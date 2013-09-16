class PostsController < ApplicationController

  before_filter :authenticate_user, only: [:new, :create]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build()
  end

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post successfully created."
      redirect_to post_path(@post.id)
    else
      flash.now[:error] = "Url cannot be blank."
      render 'new'
    end
  end

  def show
  	@post = Post.find(params[:id])
  	@comment = Comment.new()
  end

  def posts_per_user
    @posts = Post.where('user_id == ?',params[:id])
    render :index
  end


end
