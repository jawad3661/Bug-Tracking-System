class Admin::UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def index?
    @user.admin?
  end

  def edit?
    update?
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

  def show?
    @user.admin?
  end
end
