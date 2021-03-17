class RegistrationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    create?
  end

  def create?
    true
  end

  def destroy?
    record.user = user && record.lecture.upcoming?
  end
end
