class AppointmentMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_notification.subject
  #
  def appointment_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
