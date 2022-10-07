class Manager::ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.manager?
  end

  def show?
    @user.manager?
  end

  def new?
    create?
  end

  def create?
    @user.manager?
  end

  def edit?
    update?
  end

  def update?
    @user.manager?
  end

  def destroy?
    @user.manager?
  end
end
