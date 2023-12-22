class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:browse, Recipe, public: true)
    can(%i[create read update destroy], Recipe, user:)
    can(%i[create read destroy shop], Food, user:)
    can(%i[create destroy], RecipeFood, recipe: { user: })
    can(%i[create destroy], RecipeFood, food: { user: })
  end
end
