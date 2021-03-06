class BizarreCms::Content < ActiveRecord::Base
  belongs_to :contentable, polymorphic: true

  attr_accessible :body, :meta_desc, :meta_keywords, :meta_title, :summary, :top_image, :delete_image

  has_attached_file :top_image, styles: { large: '660>', medium: '200x215#' }
  attr_accessor :delete_image
  before_validation { top_image.clear if delete_image == '1' }

  @@markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)

  def to_html(field)
    content = self.send(field)
    if content.present?
      @@markdown.render(content)
    else
      ''
    end
  end

  def self.render(content)
    @@markdown.render(content)
  end
end
