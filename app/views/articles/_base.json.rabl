attributes :_id
attributes :title
attributes :description
node(:created_at) { |model| model.created_at.to_i }
node(:updated_at) { |model| model.updated_at.to_i }
