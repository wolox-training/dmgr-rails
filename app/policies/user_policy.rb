class UserPolicy < ApplicationPolicy
  def is_logged_user?
    user and record.to_i == user.id
  end
end
