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


    def more
      @movies_rating = Movie.page(params[:page]).per(6)
      @movies_view =  Movie.all.order('view_count DESC')
    end

    def create

      if params[:view] == "automatic"
          @m = ApiCall.new.api_call(params[:movie][:title])
          if @m == true
            redirect_to 'Rails.application.secrets.url/admin/movies', notice: "Movie Saved Successfully"
          else
            redirect_to new_admin_movie_path(view: params[:view]), alert: "Movie Not Found."
          end
      else
          @movie = Movie.new(movie_params)
            if @movie.save
              redirect_to 'Rails.application.secrets.url/movies', notice: "Your Movie Saved Successfully"
            else
              redirect_to new_admin_movie_path
            end
      end
    end

    def show
      @movie = Movie.find(params[:id])
      @movie_view = View.create(movie_id: @movie.id)
      @mr = Movie.find(params[:id])

    end

   private
     def movie_params
       params.require(:movie).permit( :title, :genere, :descripton, :cast, :image, :year, :web,:rating)
     end
end
