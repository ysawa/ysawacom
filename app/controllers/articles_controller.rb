class ArticlesController < ApplicationController
  respond_to :html, :json

  before_filter :find_article, only: %i(destroy edit preview show update)

  # POST /articles
  def create
    @article = Article.new(params[:article])

    if render_preview_if_enabled
      # do nothing
    elsif @article.save
      flash[:notice] = 'Article was successfully created.'
      if params[:commit] == t('helpers.submit.save_and_continue')
        respond_with @article, location: { action: :edit }
      else
        respond_with @article
      end
    else
      render action: :edit
    end
  end

  # DELETE /articles/1
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = 'Article was successfully destroyed.'

    respond_with @article, location: articles_path
  end

  # GET /articles/1/edit
  def edit
  end

  # GET /articles/new
  def new
    @article = Article.new
    respond_with @article do |format|
      format.html { render :edit }
    end
  end

  # GET /articles
  def index
    @articles = Article.desc(:created_at)
    respond_to do |format|
      format.html do
        @articles = @articles.page(params[:page])
        render
      end
      format.json do
        @articles = @articles.page(params[:page])
        @articles = @articles.published
        render
      end
    end
  end

  # GET /articles/1/preview
  def preview
    set_preview_mode
  end

  # GET /articles/1
  def show
    respond_with @article
  end

  # PUT /articles/1
  def update
    @article.write_attributes(params[:article])
    if render_preview_if_enabled
      # do nothing
    elsif @article.save
      flash[:notice] = 'Article was successfully updated.'
      if params[:commit] == t('helpers.submit.save_and_continue')
        respond_with @article, location: { action: :edit }
      else
        respond_with @article
      end
    else
      render action: :edit
    end
  end

private

  def find_article
    @article = Article.find(params[:id])
  end

  def render_preview_if_enabled
    if params[:preview]
      set_preview_mode
      render action: :preview
      return true
    end
  end
end
