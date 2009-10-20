# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title, show_title = true)
    @content_for_title = page_title.to_s
    @show_title = show_title
  end
  
  def show_title?
    @show_title
  end

  def print_categories_menu
    str = '<ul id="categories">'
    Category.all.each do |cat|
      str += '<li>' + link_to(cat.name, articles_by_category_path(cat.name))
      if admin?
        str += '<span> ' + link_to('E', edit_category_path(cat))
        str += ' | ' + link_to('D', category_path(cat), :method => :delete)
        str += '</span></li>'
      end
    end
    str += '</ul>' 
    str
  end
end
