class Ability
  include CanCan::Ability

  def initialize user
    user ||= User.new

    case user.role
    when "admin"
      can :access, :rails_admin
      can :read, :dashboard
      can :manage, [User, Provider, Category]
      can :read, [ServiceBooking]
    when "member"
    end
  end
end