class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  field :content, type: String
  field :description, type: String
  field :published, type: Boolean
  field :slug, type: String
  field :title, type: String

  index(created_at: -1)
  index(slug: 1)
end
