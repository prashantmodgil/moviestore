class MoviesController < ApplicationController

  before_action :authenticate_admin_user!,only: [:create]

  def index
    @movie = Movie.all
    @movie_carasol = Movie.order('created_at desc').limit(3)
    @movies_rating = Movie.all
    @movies_view = Movie.all
  end

  def detail
    search = params[:search]
    if search
      capital_search = search.capitalize
      downcase_search = search.downcase
      upcase_search = search.upcase
      title_search = search.titleize
      @movies_rating = Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('rating ASC')
      @movies_view =  Movie.where("title like? OR title like? OR title like? OR title like?","#{capital_search}%","#{downcase_search}%","#{upcase_search}%","#{title_search}%").order('view_count DESC')
    end
  end


  def create
    @movie = Movie.new(movie_params)
        if @movie.save
          redcolumn :image_url
    redirect_to @movie ,notice: "movie Successfully Saved"
        else
          render :new
        end
  end


  def show
    @movie = Movie.find(params[:id])
    @movie_view = View.create(movie_id: @movie.id)
  end

 private
   def movie_params
     params.require(:movie).permit(:title, :genere, :descripton, :cast, :image, :year, :web, :rating)
   end
end
