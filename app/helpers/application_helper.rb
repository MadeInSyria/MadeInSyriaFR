module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "MadeInSyria.fr"
    if page_title.empty?
      "#{base_title} | For a Geek New World" 
    else
      "#{base_title} | #{page_title}"
    end
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-danger"
        when :alert then "alert alert-danger"
    end
  end
end
