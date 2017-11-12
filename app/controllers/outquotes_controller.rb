class OutquotesController < ApplicationController
  before_action :set_outquote, only: [:show, :update, :destroy]

  # GET /outquotes
  def index
    @outquotes = Outquote.all
    if params[:article_id]
      @outquotes = Article.friendly.find(params[:article_id]).outquotes
    end
    render json: @outquotes
  end

  # GET /outquotes/1
  def show
    render json: @outquote
  end

  # POST /outquotes
  def create
    @outquote = Outquote.new(outquote_params)

    if @outquote.save
      render json: @outquote, status: :created, location: @outquote
    else
      render json: @outquote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /outquotes/1
  def update
    if @outquote.update(outquote_params)
      render json: @outquote
    else
      render json: @outquote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /outquotes/1
  def destroy
    @outquote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outquote
      @outquote = Outquote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def outquote_params
      params.require(:outquote).permit(:article_id, :text)
    end
end
