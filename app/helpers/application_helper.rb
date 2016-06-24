module ApplicationHelper
  require 'redcarpet'
  require 'rouge'
  require 'rouge/plugins/redcarpet'

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end
    def markdown(text)
      render_options = {
        filter_html:     true,
        hard_wrap:       true,
        link_attributes: { rel: 'nofollow', target: "_blank" }

      }

      renderer = HTML.new(render_options)

      extensions = {
        autolink:           true,
        superscript:        true,
        disable_indented_code_blocks: true,
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        lax_spacing: true
      }
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      markdown.render(text).html_safe
    end
end
