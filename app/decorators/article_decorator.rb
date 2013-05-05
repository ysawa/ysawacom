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

  def published
    if model.published?
      h.content_tag :span, I18n.t('articles.statuses.published'), class: 'label label-success'
    else
      h.content_tag :span, I18n.t('articles.statuses.unpublished'), class: 'label label-warning'
    end
  end
end
