class Qa::ProjectPolicy < ApplicationPolicy
  class Scope < Scope; end

  def index?
    @user.qa?
  end

  def show?
    @user.qa?
  end
end
