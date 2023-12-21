class RecipeFoodsController < ApplicationController
  def new
    @user = current_user
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @available_food = @user.foods
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find_by_id(params[:recipe_food][:recipe_id])
    @recipe_food = @recipe.recipe_foods.build(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html do
          redirect_to recipe_path(@recipe), notice: 'Recipe food was successfully created.'
        end
      else
        set_foods
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @available_food = current_user.foods
  end

  def update
    @recipe_food = RecipeFood.find_by_id(params[:id])
    respond_to do |format|
      if @recipe_food.update(recipe_food_params)
        format.html do
          redirect_to recipe_path(@recipe_food.recipe), notice: 'Recipe food was successfully updated.'
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])
    if @recipe_food.destroy
      flash[:success] = 'Ingredient deleted.'
    else
      flash[:fail] = 'Ingredient deletion unsucessful.'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
