class MoviesController < ApplicationController

before_action :authenticate_user!, except: [ :index,:show]

  def index
    @movie = Movie.all
    @movie_carasol = Movie.order('created_at desc').limit(3)
    @movies_rating = Movie.all
  end

  def detail
    search = params[:search]
    if search
      capital_search = search.capitalize
      downcase_search = search.downcase
      upcase_search = search.upcase
      title_search = search.titleize
      @movies_rating = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')

    end
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
      @movie = Movie.find(params[:id])

        if @movie.update(movie_params)
          redirect_to movie_path(@movie) ,notice: "movie Successfully Updated"
        else
          render :edit
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
