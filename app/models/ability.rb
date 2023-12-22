class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:create, Recipe)
    can(:create, Food)
    can(:create, RecipeFood)
    can(:browse, Recipe, public: true)
    can(%i[read update destroy], Recipe, user:)
    can(%i[read destroy], Food, user:)
    can(%i[read destroy], RecipeFood, recipe: { user: })
  end
end
