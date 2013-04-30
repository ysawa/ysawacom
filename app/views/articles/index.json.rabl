object false
node(:page) { @articles.current_page }
node(:count) { @articles.to_a.size }
node(:total) { @articles.total_count }
node(:per_page) { @articles.limit_value }
node(:total_pages) { @articles.total_pages }
child(:@articles) do
  extends 'articles/_base'
end
