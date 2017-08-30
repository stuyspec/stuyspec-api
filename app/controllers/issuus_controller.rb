class IssuusController < ApplicationController
  before_action :set_issuu, only: [:show, :update, :destroy]

  # GET /issuus
  def index
    @issuus = Issuu.all

    render json: @issuus
  end

  # GET /issuus/1
  def show
    render json: @issuu
  end

  # POST /issuus
  def create
    @issuu = Issuu.new(issuu_params)

    if @issuu.save
      render json: @issuu, status: :created, location: @issuu
    else
      render json: @issuu.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issuus/1
  def update
    if @issuu.update(issuu_params)
      render json: @issuu
    else
      render json: @issuu.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issuus/1
  def destroy
    @issuu.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issuu
      @issuu = Issuu.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def issuu_params
      params.require(:issuu).permit(:config, :issue, :volume)
    end
end
