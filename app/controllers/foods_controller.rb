class FoodsController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :shop

  def index; end

  def shop
    @foods = Food.accessible_by(current_ability).where.missing(:recipe_foods)
    render(:shop)
  end

  def create
    @food.user = current_user
    if @food.save
      redirect_to(foods_path)
    else
      flash.now[:errors] = @food.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @food.destroy
    redirect_to(foods_path, notice: 'Food successfully deleted')
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
