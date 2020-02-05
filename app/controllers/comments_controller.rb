class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :authenticate_author!, only: [:update, :destroy]
  before_action :set_comment, only: [:show, :update, :destroy]


  # GET /comments
  def index
    @comments = Comment.where.not(published_at: nil).all
    if params[:article_id]
      @comments = Article.friendly.find(params[:article_id]).comments
    elsif params[:user_id]
      @comments = User.friendly.find(params[:user_id]).comments
    end
    if params[:limit]
      limit = params[:limit]
      @comments = @comments.first(limit)
    end
    render json: @comments
  end

  # GET /comments/1
  def show
    if params[:article_id]
      if @comment.article_id != params[:article_id]
        render json: @comment.errors, status: :unprocessable_entity
      end
    elsif params[:user_id]
      if @comment.user_id != params[:user_id]
        render json: @comment.errors, status: :unprocessable_entity
      end
    end
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(
      comment_params.merge(user_id: current_user.id)
    )
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
    params.require(:comment).permit(:content,
                                    :text,
                                    :article_id,
                                    :published_at)
  end

  def authenticate_author!
    return render json: { success: false,
                    errors: ["You are not the author of this comment"]
                  }, status: 401 unless comment.is_author? current_user
  end
end
