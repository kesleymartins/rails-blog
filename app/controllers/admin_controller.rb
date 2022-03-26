class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_action

  def index
  end

  def posts
    @posts = Post.all.includes(:user)
  end

  def comments
    @comments = Comment.all.includes(:user, :post, :rich_text_body)
  end

  def users
    @users = User.all
  end

  private

  def authorize_action
    authorize nil, policy_class: AdminPolicy
  end
end
