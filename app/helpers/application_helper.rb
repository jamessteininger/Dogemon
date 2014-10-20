module ApplicationHelper
  def flash_class(level)
      case level
          when :notice then "alert alert-info"
          when :success then "alert alert-success"
          when :error then "alert alert-error"
          when :alert then "alert alert-error"
      end
  end
  def element_icon(element)
    if (element == "Sol")
      return raw '<i class="fa fa-sun-o text-danger fa-x"></i>'
    end
    if (element == "Luna")
      return raw '<i class="fa fa-moon-o text-primary fa-x"></i>'
    end
    if (element == "Terra")
      return raw '<i class="fa fa-globe text-success fa-x"></i>'
    end
  end
            def item_element_button(element, name, item)
              if (element == "Sol")
                return link_to item, class: 'btn btn-danger btn-block' do
                  raw '<i class="fa fa-sun-o fa-x"></i>' + " " + truncate(name, length: 22)
                end
              end
              if (element == "Luna")
                return link_to item, class: 'btn btn-primary btn-block' do
                  raw '<i class="fa fa-moon-o fa-x"></i>' + " " + name
                end
              end
              if (element == "Terra")
                return link_to item, class: 'btn btn-success btn-block' do
                  raw '<i class="fa fa-globe fa-x"></i>' + " " + name
                end
              end
            end
  def item_element_heading(element)
    if (element == "Sol")
      return raw '<h4 class="">'
    end
    if (element == "Luna")
      return raw '<h4 class="text-primary">'
    end
    if (element == "Terra")
      return raw '<h4 class="text-success">'
    end
  end
end
