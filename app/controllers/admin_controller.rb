class AdminController < ApplicationController
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
end
