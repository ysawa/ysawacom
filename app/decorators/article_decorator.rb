class ArticleDecorator < Draper::Decorator
  delegate_all

  def content
    if model.content?
      h.markdown.render(model.content).html_safe
    end
  end

  def title
    if model.title?
      model.title
    else
      t '.title', default: model_class.model_name.human
    end
  end
end
