module ApplicationHelper

  def full_site_title(page_title)
    base_title = "Social Dice"
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
end
