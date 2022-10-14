class Admin::UserPolicy < ApplicationPolicy
  class Scope < Scope; end

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
