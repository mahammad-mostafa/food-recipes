class FoodsController < ApplicationController
  def new
    @food = Food.new
    @user = current_user
  end

  def index
    @foods = current_user.foods
    @user = current_user
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy
    flash[:success] = 'Food item deleted successfully.'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :user, :quantity)
  end
end
