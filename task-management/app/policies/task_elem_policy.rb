class TaskElemPolicy < ApplicationPolicy
  attr_reader :user, :task_elem

  def initialize(user, task_elem)
    @user = user
    @task_elem = task_elem
  end

  def update?
    user.admin? || !task_elem.published?
  end

  class Scope < Scope
  end
end