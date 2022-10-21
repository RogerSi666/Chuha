class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :redirect, only: [:destroy, :edit]

  def index
    @posts = Post.includes(:user).all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    if @post.user_id == current_user.id
    else
      redirect_to post_path
    end
  end

  def update
    @post.update(post_params)
    if @post.valid?
      redirect_to post_path(post_params)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def redirect
    redirect_to action: :index if current_user.id != @post.user.id
  end

  def post_params
    params.require(:post).permit(:post_title, :post_text, :image).merge(user_id: current_user.id)
  end
end
