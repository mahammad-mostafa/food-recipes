class UsersController < ApplicationController
  def index
    @recipes = Recipe.where(user: current_user).length
    @foods = Food.where(user: current_user).length
  end
end
