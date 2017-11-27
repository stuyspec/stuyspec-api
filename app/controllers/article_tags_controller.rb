class ArticleTagsController < ApplicationController
  before_action :set_article_tag, only: [:show, :update, :destroy]

  # GET /article_tags
  def index
    @article_tags = ArticleTag.all

    render json: @article_tags
  end

  # GET /article_tags/1
  def show
    render json: @article_tag
  end

  # POST /article_tags
  def create
    @article_tag = ArticleTag.new(article_tag_params)

    if @article_tag.save
      render json: @article_tag, status: :created, location: @article_tag
    else
      render json: @article_tag.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /article_tags/1
  def update
    if @article_tag.update(article_tag_params)
      render json: @article_tag
    else
      render json: @article_tag.errors, status: :unprocessable_entity
    end
  end

  # DELETE /article_tags/1
  def destroy
    @article_tag.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_tag
      @article_tag = ArticleTag.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def article_tag_params
      params.fetch(:article_tag, {})
    end
end
