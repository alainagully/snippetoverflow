module SnippetsHelper
  def html_kind(kind)
     k = kind.downcase

     case k
     when "ruby"
       {color: "panel-ruby", icon: fa_icon('diamond'), text: "Ruby" }
     when "html"
       {color: "panel-html", icon: fa_icon('html5'), text: "HTML" }
     when "javascript"
       {color: "panel-javascript", icon: fa_icon("coffee"), text: "JavaScript" }
     when "css"
       {color: "panel-css", icon: fa_icon('css3'), text: "CSS" }
     when "python"
       {color: "panel-python", icon: fa_icon('plus'), text: "Python" }
     when "markdown"
       {color: "panel-markdown", icon: fa_icon('flag'), text: "Markdown" }
     else
       {color: "panel-default", icon: ""}
     end

   end
end
