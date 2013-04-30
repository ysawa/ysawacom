class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
  field :content, type: String
  field :published, type: Boolean
  field :slug, type: String
  field :title, type: String
end
