class Ability
  include CanCan::Ability

  def initialize(user)
    can(%i[show browse], Recipe, public: true)
    return unless user.present?

    can(%i[create read update destroy], Recipe, user:)
    can(%i[create read destroy shop], Food, user:)
    can(%i[create destroy], RecipeFood, recipe: { user: })
    can(%i[create destroy], RecipeFood, food: { user: })
  end
end
