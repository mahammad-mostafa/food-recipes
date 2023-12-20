class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can(:read, :recipes, public: true)
    can(:read, :recipes, user:)
    can(:create, :recipes)
    can(:create, :foods)
    can(:create, :recipes_foods)
    can(:destroy, :recipes, user:)
    can(:destroy, :foods, user:)
    can(:destroy, :recipes_foods, recipe: { user: })
  end
end
