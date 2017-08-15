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
    render json: @comment
  end

  # POST /comments
  def create
    if params[:article_id]
      @article = Article.friendly.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
    elsif params[:user_id]
      @user = User.friendly.find(params[:user_id])
      @comment = @user.comments.create(comment_params)
    end
    @comment = Comment.create(comment_params)
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
