class API::V1::RankinsController < ApplicationController
  before_action :set_rankin, only: [:show, :update, :destroy]

  def index
    @rankins = Rankin.all
    # render json: @rankins
  end

  def show
    # render json: @rankin
  end

  def create
    @rankin = Rankin.new(rankin_params)

    if @rankin.save
      render json: @rankin, status: :created, location: @rankin
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
