class RecipesController < ApplicationController
  before_action :authenticate_user!, except: %i[show public]
  load_and_authorize_resource
  skip_authorize_resource only: :public

  def index
    @recipes = Recipe.includes(:user).accessible_by(current_ability).page(params[:page])
  end

  def show
    @recipe = Recipe.includes(recipe_foods: { food: :user }).accessible_by(current_ability).find(params[:id])
  end

  def public
    @recipes = Recipe.includes(%i[user recipe_foods]).accessible_by(current_ability, :browse).order(id: :desc)
      .page(params[:page])
    render(:public)
  end

  def create
    @recipe.public = false
    @recipe.user = current_user
    if @recipe.save
      redirect_to(recipe_path(@recipe))
    else
      flash.now[:errors] = @recipe.errors.full_messages
      render(:new, status: :unprocessable_entity)
    end
  end

  def edit
    @recipe.public = !@recipe.public
    @recipe.save
    redirect_to(recipe_path(@recipe))
  end

  def destroy
    @recipe.destroy
    redirect_to(recipes_path, notice: 'Recipe successfully deleted')
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
