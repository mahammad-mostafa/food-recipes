class RecipeFoodsController < ApplicationController
  load_and_authorize_resource :recipe
  load_and_authorize_resource :recipe_food, through: :recipe

  def new
    @foods = Food.accessible_by(current_ability)
  end

  def create
    authorize!(:create, @recipe_food.food) if @recipe_food.food
    if @recipe_food.save
      redirect_to(recipe_path(@recipe), notice: 'Ingredient successfully added')
    else
      @foods = Food.accessible_by(current_ability)
      flash.now[:errors] = @recipe_food.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  def destroy
    @recipe_food.destroy
    redirect_to(recipe_path(@recipe), notice: 'Ingredient successfully deleted')
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity)
  end
end
