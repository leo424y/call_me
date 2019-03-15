class UxersController < ApplicationController
  before_action :set_uxer, only: [:show, :update, :destroy]

  # GET /uxers
  def index
    @uxers = Uxer.all

    render json: @uxers
  end

  # GET /uxers/1
  def show
    render json: @uxer
  end

  # POST /uxers
  def create
    Uxer.create(uid: params[:uid], pub: params[:pub], last_time: Time.now)
    # @uxer = Uxer.new(uxer_params)

    # if @uxer.save
    #   render json: @uxer, status: :created, location: @uxer
    # else
    #   render json: @uxer.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /uxers/1
  def update
    if @uxer.update(uxer_params)
      render json: @uxer
    else
      render json: @uxer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /uxers/1
  def destroy
    @uxer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_uxer
      @uxer = Uxer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def uxer_params
      params.require(:uxer).permit(:uid, :pub, :last_time)
    end
end
