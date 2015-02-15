class RepliesController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]
	def create
                @comment = Comment.find(params[:comment_id])
                @movie = Movie.find(params[:movie_id])
                @reply = @comment.replies.build(reply_params)
                @reply.comment = @comment
                @reply.user = current_user
                @reply.save
                redirect_to @movie
    end


    def destroy
        @comment = Comment.find(params[:comment_id])
        @movie = Movie.find(params[:movie_id])
        @reply = Reply.find(params[:id])
        @reply.destroy
        redirect_to @movie
    end

    private
        # Never trust parameters from the scary internet, only allow the white list through.
        def reply_params
            params.require(:reply).permit(:comment_id, :user_id, :body)
        end
end