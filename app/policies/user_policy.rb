class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record_is_a_star?
  end

  def tagged?
    true
  end

  def user_dashboard?
    true
  end

  def star_dashboard?
    true
  end

  def create?
    true
  end

  def update?
    user_is_owner_or_admin?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end

  def record_is_a_star?
    record.star == true
  end
end
