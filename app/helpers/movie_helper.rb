module MovieHelper
  def rating_check(abc)
    if abc == "rating"
      return "active"
    end
  end
  def view_check(abc)
    if abc == "view"
      return "active"
    end
  end
end
