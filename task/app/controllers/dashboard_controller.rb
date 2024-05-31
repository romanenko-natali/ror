class DashboardController < ApplicationController
  before_action :redirect_if_logged_in, only: :index

  def index
    # This action will render the welcome content
  end

  private

  def redirect_if_logged_in
    redirect_to projects_path if current_user
  end
end
