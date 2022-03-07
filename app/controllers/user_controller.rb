class UserController < ApplicationController
  before_action :set_user

  def profile
    @user.update(views: @user.views + 1)
    @posts = Post.all.from_user(@user.id)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
