ActiveAdmin.register Movie do
 permit_params :title, :genere, :descripton, :cast, :image, :year, :web, :rating, :view

   decorate_with MovieDecorator
 index do
   selectable_column
    id_column
    column :title
    column :genere
    column :description
    column :cast
    column :image
    column :year
    column :web
    column :rating
    actions
  end

  filter :title
  filter :genre

    action_item :new_movie,automatically_movie_upload: :index do

    link_to "Automatically Movie Upload","#{Rails.application.secrets.url}/admin/movies/new?view=automatic"
  end

    form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs do
        render "movies/form",{movies: movie,view: params[:view]}
      end
    end
end
