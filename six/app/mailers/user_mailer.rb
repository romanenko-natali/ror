# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
    default from: 'appmoneta@gmail.com'
  
    def task_notification(user, task)
      @user = user
      @task = task
      mail(to: @user.email, subject: 'Task Notification')
    end
  end
  