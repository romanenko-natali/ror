# Assuming you have a UserMailer configured in your Rails application
class UserMailer < ApplicationMailer
    def update_notification(user)
      @user = user
      mail(to: @user.email, subject: 'Your account has been updated!')
    end
  end
  