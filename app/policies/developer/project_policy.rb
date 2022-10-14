class Developer::ProjectPolicy < ApplicationPolicy
  class Scope < Scope; end

  def index?
    @user.developer?
  end

  def show?
    @user.developer?
  end
end
