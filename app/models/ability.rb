class Ability
  include CanCan::Ability

  def initialize(current_user)
    # Define abilities for the passed in user here.
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    
    current_user ||= User.new # guest user (not logged in)    
    
    alias_action :create, :read, :to => :cr
    alias_action :update, :destroy, :delete, :to => :ud
    
    if current_user.role == 'admin'
      can :manage, :all
    else
      can [:update, :update_password], User do |user|
        user == current_user
      end 
      
      can :reset_password, User
      
      can :show, User
      
      can [:create, :load_expressions, :load_dictionary, :load_discussions,], Language
      
      #can :update, Language do |lang|
      #  current_user.id == lang.user_id
      #end
      
      can :create, Comment
      
      can :ud, Comment do |comm|
        current_user.id == comm.user_id
      end      
      
      can :create, Expression
      
      can :ud, Expression do |exp|
        current_user.id == exp.user_id
      end
      
      can :create, Discussion
      
      can :ud, Discussion do |discu|
        current_user.id == discu.user_id
      end
      
      can :create, Votation
      
      can :create, Translation
      
      can :ud, Translation do |trans|
        current_user.id == trans.user_id
      end
    end
      
    
       
  end
  
end
