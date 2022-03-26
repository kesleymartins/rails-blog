class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post
    before_action :set_comment, except: %i[ create ]
    before_action :authorize_action, except: %i[ create ]

    def create
      @comment = @post.comments.create(comment_params)
      @comment.user = current_user

      if @comment.save
        redirect_to post_path(@post), notice: "Comment has been created"
      else
        redirect_to post_path(@post), alert: "Comment has not been created"
      end
    end

    def destroy
      @comment.destroy
      redirect_to post_url(@post), notice: "comment has been deleted"
    end

    def update
      if @comment.update(comment_params) then
        redirect_to post_url(@post), notice: "comment has been updated"
      else
        redirect_to post_url(@post), alert: "Comment has not been updated"
      end
    end

    private

    def authorize_action
      authorize @comment
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
