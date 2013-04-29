class ArticlesController < ApplicationController
  respond_to :html, :json

  before_filter :find_article, only: %i(destroy edit show update)

  # POST /articles
  def create
    @article = Article.new(params[:article])

    if @article.save
      respond_with @article
    else
      render action: :new
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
    respond_with @article
  end

  # GET /articles
  def index
    @articles = Article.page(params[:page])

    respond_with @articles
  end

  # GET /articles/1
  def show
    respond_with @article
  end

  # PUT /articles/1
  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = 'Article was successfully updated.'
      respond_with @article
    else
      render action: :edit
    end
  end

private

  def find_article
    @article = Article.find(params[:id])
  end
end
