class CommentsController < ApplicationController
before_action :authenticate_user!

def new
end

def create
  @comment = Comment.new(comment_params)
  @comment.user_id = current_user.id
  @comment.commenter = current_user.email
  @comment.movie_id = params[:movie_id]
  @comment.save
    redirect_to movie_path(id: params[:movie_id])
  end

def destroy
  debugger
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
end


    private
      def comment_params
        params.require(:comment).permit(:commenter, :body)
      end

end
