class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    user.try(:admin?) || record.project.has_member?(user)
  end
end
