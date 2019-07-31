class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    user_is_owner_or_admin?
  end

  def create?
    return true
  end

  def update?
    record.service.user_id == user.id
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
