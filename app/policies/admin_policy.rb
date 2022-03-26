class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.has_role?(:admin)
  end

  def posts?
    index?
  end

  def comments?
    index?
  end

  def users?
    index?
  end
end
