class MovieDecorator < Draper::Decorator
  delegate_all
  def image
      if movie.image_url.present?
        h.image_tag(movie.image_url, width: "50px",height: "50px")
      else
      end
    end
end
