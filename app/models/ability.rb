class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Group
    can :create, Group
    can :write, Group

    can :read, Entity
    can :create, Entity

    return unless user.present?

    can :destroy, Group, user: user
    can :destroy, Entity, user:
  end
end
