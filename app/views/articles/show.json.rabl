object false

child :@article do
  attributes :_id
  attributes :title
  attributes :content
  node(:created_at) { |model| model.created_at.to_i }
  node(:updated_at) { |model| model.updated_at.to_i }
end
