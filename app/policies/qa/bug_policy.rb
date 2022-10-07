class Qa::BugPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def show?
    @user.qa?
  end

  def new?
    create?
  end

  def create?
    @user.qa?
  end

  def edit?
    update?
  end

  def update?
    @user.qa?
  end

  def destroy?
    @user.qa?
  end
end
