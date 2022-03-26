class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_action

  def index
  end

  def posts
    @posts = Post.all
  end

  def comments
    @comments = Comment.all
  end

  def users
    @users = User.all
  end

  private

  def authorize_action
    authorize nil, policy_class: AdminPolicy
  end
end
