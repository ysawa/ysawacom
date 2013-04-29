articles_array = @articles.to_a
object false
node(:page) { @articles.current_page }
node(:count) { articles_array.size }
node(:total) { @articles.total_count }
node(:per_page) { @articles.limit_value }
node(:total_pages) { @articles.total_pages }
node(:articles) do
  object :articles => @articles
end
