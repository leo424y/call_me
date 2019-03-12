class CallsController < ApplicationController
  before_action :set_call, only: [:show, :update, :destroy]

  # GET /calls
  def index
    @calls = Call.all

    render json: @calls
  end

  # GET /calls/1
  def show
    require 'securerandom'
    stamp = Time.zone.now.to_formatted_s(:db)
    content = SecureRandom.hex
    Call.create(num: '0934123424', stamp: stamp , content: content, audio: 'abc.wav')

    render json: @call
  end

  # POST /calls
  def create
    @call = Call.new(call_params)

    if @call.save
      render json: @call, status: :created, location: @call
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /calls/1
  def update
    if @call.update(call_params)
      render json: @call
    else
      render json: @call.errors, status: :unprocessable_entity
    end
  end

  # DELETE /calls/1
  def destroy
    @call.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def call_params
      params.require(:call).permit(:num, :stamp, :content, :audio)
    end
end
