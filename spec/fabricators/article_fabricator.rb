Fabricator(:article) do
  title     { "Article #{sequence(:article_title)}" }
  content     { "Article Content #{sequence(:article_content)}" }
  slug     { "article_#{sequence(:article_slug)}" }
  published true
end
