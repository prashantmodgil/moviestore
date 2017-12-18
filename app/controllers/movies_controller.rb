class MoviesController < ApplicationController

  def index
    @movie = Movie.all
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
        if @movie.save
          redirect_to @movie ,notice: "movie Successfully Saved"
        else
          render :new
        end
  end

  def edit
    @movie =  Movie.find(params[:id])
  end



  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    redirect_to movies_path
  end

    def update
      @movie =  Movie.update(movie_params)
        if @movie
          redirect_to movie_path(@movie) ,notice: "movie Successfully Saved"
        else
          renderails migration change column type integer to dater :edit
        end
      end

  def show
    @movie = Movie.find(params[:id])
  end


 private
   def movie_params
     params.require(:movie).permit(:title, :genere, :descripton, :cast, :image, :year)
   end
end
