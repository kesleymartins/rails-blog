class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

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
        @comment = @post.comments.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end

    def update
        @comment = @post.comments.find(params[:id])
        
        if @comment.update(comment_params) then
            redirect_to post_url(@post), notice: "Commnet has been updated"
        else
            redirect_to post_url(@post), alert: "Comment has not been updated"
        end
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end