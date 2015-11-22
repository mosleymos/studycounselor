class LeadMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.send_lead.subject
  #
  def send_lead
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
