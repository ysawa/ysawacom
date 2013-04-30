object false

child :@article do
  extends 'articles/_base'
  node(:content_html) do |model|
    model.content
  end
end
