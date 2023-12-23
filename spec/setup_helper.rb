module Setup
  def initializer(action = '')
    user = User.create!(name: 'user', email: 'email@domain.com', password: 'password')
    params = { user_id: user.id, name: 'recipe', description: 'description', preparation_time: 0.25, cooking_time: 1.5 }
    recipe = Recipe.create!(params)
    food = Food.create!(user_id: user.id, name: 'food', measurement_unit: 'grams', price: 9.20, quantity: 5)
    RecipeFood.create!(recipe_id: recipe.id, food_id: food.id, quantity: 1)
    Food.create!(user_id: user.id, name: 'food', measurement_unit: 'kilos', price: 4.50, quantity: 2)
    sign_in(user) if action == 'login'
    return unless action == 'public'

    recipe.public = true
    recipe.save!
  end
end
