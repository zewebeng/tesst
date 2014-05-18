class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      # not logged in
    else
      can :read, User

      can :read, MeetupGroup
      can :manage, MeetupGroup, owner_id: user.id

      can :read, Activity
      can :manage, Activity do |activity|
        user.managing_meetup_groups.include?(activity.meetup_group)
      end

      # A user can remove himself from a meetup group
      can :manage, Membership do |membership|
        membership.user == user || membership.meetup_group.owner == user
      end

      # The owner of a meetup group should not be able to delete himself
      cannot :delete, Membership do |membership|
        membership.user == user && membership.meetup_group.owner == user
      end

      can :manage, Vote do |vote|
        vote.user == user && user.meetup_groups.include?(vote.activity.meetup_group)
      end
    end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/bryanrite/cancancan/wiki/Defining-Abilities
  end
end