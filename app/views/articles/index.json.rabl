articles_array = @articles.to_a
object false
node(:page) { @articles.current_page }
node(:count) { articles_array.size }
node(:total) { @articles.total_count }
node(:per_page) { @articles.limit_value }
node(:total_pages) { @articles.total_pages }
child(:@articles) do
  attributes :_id
  attributes :title
  node(:created_at) { |model| model.created_at.to_i }
  node(:updated_at) { |model| model.updated_at.to_i }
end
