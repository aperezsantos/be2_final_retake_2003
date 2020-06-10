class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgeries = Surgery.all
    @surgery = Surgery.find(params[:id])
  end

  def new
  end

  def create
    surgery = Surgery.new(surgery_params)
    surgery.save!
    redirect_to "/surgeries"
  end

  def update
    surgery = Surgery.find(params[:id])
    surgery.doctors << Doctor.find(params[:doctor_id])

    redirect_to "/surgeries/#{surgery.id}"
  end

  private
  def surgery_params
    params.permit(:title, :day, :room)
  end
end
