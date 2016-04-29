class Article < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :web, :hacking
  include PgSearch
  pg_search_scope :search_by_full_article, :against => [:text, :title]
  #multisearchable :against => [:text, :title]
  def self.text_search(query)
    if query.present?
      where("title ilike :q or text ilike :q", q: "%#{query}%")
    else
      all
    end
  end
end
