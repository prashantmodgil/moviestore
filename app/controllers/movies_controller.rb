class MoviesController < ApplicationController

  def index
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie =  Movie.new(movie_params)
        if @movie.save
          redirect_to @movie ,notice: "movie Successfully Saved"
        else
          render :new
        end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def show
    @movie = Movie.find(params[:id])
  end


 private
   def movie_params
     params.require(:movie).permit(:title, :genere, :descripton, :cast)
   end

end
