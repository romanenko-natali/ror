


class DashboardController < ApplicationController
    before_action :logged_in_user
  
    def index
      @projects = current_user.projects
      @invited_projects = current_user.invited_projects






















































    end
  
    private
  
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
  end
  