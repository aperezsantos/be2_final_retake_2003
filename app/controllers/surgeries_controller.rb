class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
  end

  def new
  end

  def create
    surgery = Surgery.new(surgery_params)
    surgery.save!
    redirect_to "/surgeries"
  end

  private
  def surgery_params
    params.permit(:title, :day, :room)
  end
end
