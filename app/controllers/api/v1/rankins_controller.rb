class API::V1::RankinsController < ApplicationController
  before_action :set_rankin, only: [:show, :update, :destroy]

  # Format: http://localhost:3000/api/v1/rankins
  def index
    @rankins = Rankin.all
  end

  # Format: http://localhost:3000/api/v1/rankins/1
  def show
  end

  # Format http://localhost:3000/api/v1/rankins?rankin[first_name]=Ben&rankin[last_name]=Hur
  def create
    @rankin = Rankin.new(rankin_params)

    if @rankin.save
      render json: @rankin, status: :created, location: api_v1_rankin_url(@rankin, format: :json)
    else
      render json: @rankin.errors, status: :unprocessable_entity
    end
  end

  def update
    @rankin = Rankin.find(params[:id])

    if @rankin.update(rankin_params)
      head :no_content
    else
      render json: @rankin.errors, status: :unprocessable_entity
    end
  end

  # Format: http://localhost:3000/api/v1/rankins/29
  def destroy
    @rankin.destroy

    head :no_content
  end

  private

    def set_rankin
      @rankin = Rankin.find(params[:id])
    end

    def rankin_params
      params.require(:rankin).permit(:first_name, :last_name, :birthday, :city, :state)
    end
end
