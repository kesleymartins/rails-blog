class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]

  def index
    @posts = Post.all.latests
  end

  def show
    @post.update(views: @post.views + 1)
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        redirect_to post_url(@post), notice: "Post was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        redirect_to post_url(@post), notice: "Post was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      redirect_to posts_url, notice: "Post was successfully destroyed."
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
