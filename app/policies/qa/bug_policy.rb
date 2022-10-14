class Qa::BugPolicy < ApplicationPolicy
  class Scope < Scope; end

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
