class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post

    def create
        @comment = @post.comments.create(permit_params)
        @comment.user = current_user

        if @comment.save
            redirect_to post_path(@post), notice: "Comment has been created"
        else
            redirect_to post_path(@post), alert: "Comment has not been created"
        end
        
    end

    def destroy
        @comment = @Post.comments.find(params[:id])
        @comment.destroy

        redirect_to post_path(@post)
    end

    private

    def set_post
        @post = Post.find(params[:post_id])
    end

    def permit_params
        params.require(:comments).permit(:body)
    end
end