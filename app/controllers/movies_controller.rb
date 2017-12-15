class MoviesController < ApplicationController

  def index
    @movie = Movie.all
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
    @movie =  Movie.find(params[:id])
  end



  def destroy
  end

    def update
      @movie =  Movie.update(movie_params)
        if @movie
          redirect_to movie_path(@movie) ,notice: "movie Successfully Saved"
        else
          render :edit
        end
      end

  def show
    @movie = Movie.find(params[:id])
  end


 private
   def movie_params
     params.require(:movie).permit(:title, :genere, :descripton, :cast, :image)
   end
end
