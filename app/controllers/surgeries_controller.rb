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
    dorctor = surgery.doctors.find(params[:id])
    if surgery.update(surgery_params)
      redirect_to "/surgeries/#{surgery.id}"
    end
  end

  private
  def surgery_params
    params.permit(:title, :day, :room)
  end
end
