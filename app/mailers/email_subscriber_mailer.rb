class EmailSubscriberMailer < ApplicationMailer
  default :from => 'info@stuyspec.com'

  # send email
  def send_email(users, subject, content)
    @content = content
    users.each do user
      @user = user
      mail( :to => @user.email,
          :subject => subject)
    end
  end
end
