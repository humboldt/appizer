class ApplicationPolicy
  include Pundit::Actions

  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def dashboard?
    user
  end

  def destroy?
    user
  end

  def edit?
    user
  end

  def export?
    user
  end

  def history?
    user
  end

  def index?
    user
  end

  def new?
    user
  end

  def show?
    user
  end

  def show_in_app?
    user
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
