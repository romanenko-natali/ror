# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @projects = current_user.projects
      @tasks = Task.joins(:projects).where(projects: { user_id: current_user.id }).distinct
    end
  end
  