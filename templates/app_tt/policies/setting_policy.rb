class SettingPolicy < ApplicationPolicy
  def destroy?
    false
  end

  def export?
    false
  end

  def new?
    false
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.settings
    end
  end
end
