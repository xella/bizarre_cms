class BizarreCms::AbstractPage < ActiveRecord::Base
  attr_accessible :page_type, :parent_id, :published, :slug, :title, :linked_abstract_page_ids
  #include Contentable

  acts_as_nested_set

  has_many :abstract_page_links, dependent: :destroy
  has_many :linked_abstract_pages, through: :abstract_page_links

  scope :for_link_select, joins(:page_type).order('page_types.title, abstract_pages.title')

  validates :title, uniqueness: [:parent_id], presence: true
  validates :slug, uniqueness: true, presence: true

  # TODO can we remove this method with awesome_nested set builid helper
  def self.parent_collection_for page=nil
    order(:lft).map {|p| ['-- '*p.level + p.title, p.id]}
  end

  def self.tree_children
    roots.map &:to_tree_children
  end

  def to_tree_children
    {
      id: self.id,
      label: self.title,
      children: self.children.map(&:to_tree_children)
    }
  end

  # prevent to destroy branch
  before_destroy :leaf?
end
