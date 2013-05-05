class ArticlesController < ApplicationController
  respond_to :html, :json

  before_filter :find_article, only: %i(destroy edit show update)

  # POST /articles
  def create
    @article = Article.new(params[:article])

    if @article.save
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

  # GET /articles/1
  def show
    respond_with @article
  end

  # PUT /articles/1
  def update
    if @article.update_attributes(params[:article])
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
end
