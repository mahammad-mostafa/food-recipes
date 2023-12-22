class RecipesController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :public

  def index; end

  def public
    @recipes = Recipe.accessible_by(current_ability, :browse).order(id: :desc)
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
    redirect_to(recipes_path, alert: 'Recipe successfully deleted')
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time)
  end
end
