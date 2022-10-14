class Developer::BugPolicy < ApplicationPolicy
  class Scope < Scope; end

  def edit?
    update?
  end

  def update?
    @user.developer?
  end

  def show?
    @user.developer?
  end
end
