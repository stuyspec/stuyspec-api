class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  # GET /comments
  def index
    @comments = Comment.all
    if params[:article_id]
      @comments = Article.friendly.find(params[:article_id]).comments
    elsif params[:user_id]
      @comments = User.friendly.find(params[:user_id]).comments
    end
    render json: @comments
  end

  # GET /comments/1
  def show
    if params[:article_id]
      if @comment.article_id == params[:article_id]
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
    elsif params[:user_id]
      if @comment.user_id == params[:user_id]
        render json: @comment
      else
        render json: @comment.errors, status: :unprocessable_entity
      end
      else
        render json: @comment
      end
    end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:content, :text, :comment_id, :user_id, :article_id)
  end
end
