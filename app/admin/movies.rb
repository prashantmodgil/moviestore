ActiveAdmin.register Movie do
 permit_params :title, :genere, :descripton, :cast, :image, :year, :web, :rating
 index do
   selectable_column
    id_column
    column :title
    column :genere
    column :description
    column :cast
    column :image<a class="button" <%= link_to 'Edit',edit_movie_path(@movie) %></a>

    column :year
    column :web
    column :rating
    actions
  end

  filter :title
    filter :genre

    action_item :new_movie,only: :index do
      link_to "Automatically Movie Upload", "http://localhost:3000/admin/movies/new?view=automatic"
    end

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        render "movies/form",{movies: movie,view: params[:view]}
      end
    end
end
