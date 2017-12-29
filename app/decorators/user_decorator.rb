class UserDecorator < Draper::Decorator
  delegate_all

  def image
      if user.image_url.present?
        h.image_tag(user.image_url, width: "50px",height: "50px")
      else
      end
    end

end
