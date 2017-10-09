class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index
    if params[:section_id]
      @section = Section.friendly.find(params[:section_id])
      @articles = Article.where("section_id = ?", @section.id)
    else
      @articles = Article.all
    end
    if params[:order_by] == 'rank'
      @articles = @articles.order {|article| find_combined_rank(article)}.reverse
    end
    if params[:order_by] == 'date'
      @articles = @articles.reverse
    end
    if params[:limit]
      limit = params[:limit]
      @articles = @articles.first(limit)
    end
    @articles_with_volume_and_issue = []
    @articles.each do |article|
      volume = article.newspaper.volume
      issue = article.newspaper.issue
      article = article.attributes
      article["volume"] = volume
      article["issue"] = issue
      @articles_with_volume_and_issue.append(article)
    end
    render json: @articles_with_volume_and_issue
  end

  # GET /articles/1
  def show
    render json: @article
  end

  # POST /articles
  def create
    @section = Section.friendly.find(params[:section_id])
    # Can't let people publish by default
    @article = @section.articles.build(
      article_params.merge(is_published: false)
    )

   if @article.save
      render json: @article, status: :created, location: @article
   else
      render json: @article.errors, status: :unprocessable_entity
   end
  end

  # PATCH/PUT /articles/1
  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  # DELETE /articles/1
  def destroy
    @article.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_params
      params.require(:article).permit(:title, :slug, :content, :newspaper_id, :is_published, :section_id, :summary, :rank)
    end
    def find_combined_rank (article)
      return article.rank + Section.friendly.find(article.section_id).rank * 1.5
    end
end
