class CarModelsController < ApplicationController
  def index
    @car_models = CarModel.all 
  end

  def show
    @car_model = CarModel.find(params[:id])
  end

  def new
    @car_model = CarModel.new
    @car_categories = CarCategory.all
  end

  def create
    @car_model = CarModel.new(car_model_params)
    if @car_model.save
      redirect_to @car_model
    else
      @car_categories = CarCategory.all
      render :new
    end
  end
end


private

def car_model_params
  params.require(:car_model)
        .permit(:name, :year, :manufacturer, :motorization, 
                :fuel_type, :car_category_id)
end


