class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/session/new"
    mail(from: "everybody@appacademy.io", to: @user.username, subject: "Welcome to 99 Cats!" )
  end
end
