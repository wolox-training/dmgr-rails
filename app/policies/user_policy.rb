# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def logged_user?
    user && (record.to_i == user.id)
  end
end
