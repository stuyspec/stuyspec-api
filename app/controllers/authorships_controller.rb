class AuthorshipsController < ApplicationController
  before_action :set_authorship, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /authorships
  def index
    if params[:article_id]
      @article = Article.friendly.find(params[:article_id])
      @authorships = Authorship.where("article_id = ?", @article.id)
    else
      @authorships = Authorship.all
    end
    render json: @authorships
  end

  # GET /authorships/1
  def show
    render json: @authorship
  end

  # POST /authorships
  def create
    @authorship = Authorship.new(authorship_params)

    if @authorship.save
      render json: @authorship, status: :created, location: @authorship
    else
      render json: @authorship.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authorships/1
  def update
    if @authorship.update(authorship_params)
      render json: @authorship
    else
      render json: @authorship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authorships/1
  def destroy
    @authorship.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorship
      @authorship = Authorship.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def authorship_params
      params.require(:authorship).permit(:user_id, :article_id)
    end
end
