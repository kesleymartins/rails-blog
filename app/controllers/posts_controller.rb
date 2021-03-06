class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :authorize_action, only: %i[ edit update destroy ]

  def index
    @query = Post.ransack(params[:q])
    @pagy, @posts = pagy(@query.result.includes(:user).latests, items: 9)
  end

  def show
    @post.update(views: @post.views + 1)
    @comments = @post.comments.includes(:user, :rich_text_body).latests

    mark_notification_as_read
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to post_url(@post), notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_url(@post), notice: "Post was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private
    def authorize_action
      authorize @post
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def mark_notification_as_read
      if current_user
        notifications_to_mark_as_read = @post.notifications_as_post.where(recipient: current_user)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end
    end
end
