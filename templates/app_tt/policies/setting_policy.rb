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

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.visible
    end
  end
end
