module ApplicationHelper
  def title(page_title)
    content_for(:title) { " - #{page_title.to_s}".html_safe }
  end
  
  def link_to_remove_fields(image_name,style_class, f)
    f.hidden_field(:_destroy) + link_to_function(image_tag("icn/"+image_name, :border => 0), "remove_fields(this)", :class => style_class)
  end
end
