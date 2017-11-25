class NewspapersController < ApplicationController
  before_action :set_newspaper, only: [:show, :update, :destroy]

  # GET /newspapers
  def index
    @newspapers = Newspaper.all

    render json: @newspapers
  end

  # GET /newspapers/1
  def show
    render json: @newspaper
  end

  # POST /newspapers
  def create
    @newspaper = Newspaper.new(newspaper_params)

    if @newspaper.save
      render json: @newspaper, status: :created, location: @newspaper
    else
      render json: @newspaper.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /newspapers/1
  def update
    if @newspaper.update(newspaper_params)
      render json: @newspaper
    else
      render json: @newspaper.errors, status: :unprocessable_entity
    end
  end

  # DELETE /newspapers/1
  def destroy
    @newspaper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newspaper
      @newspaper = Newspaper.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def newspaper_params
      params.require(:newspaper).permit(:issue, :volume, :issuu_config)
    end
end
