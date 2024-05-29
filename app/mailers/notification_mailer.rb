class NotificationMailer < ApplicationMailer
    def task_assignment_email(user, task)
      @user = user
      @task = task
      mail(to: @user.email, subject: 'You have been assigned a new task')
    end
  
    default from: 'notifications@example.com'

    def project_update_email(user, project)
        @user = user
        @project = project
        mail(to: @user.email, subject: 'Project has been updated')
    end
  end
  