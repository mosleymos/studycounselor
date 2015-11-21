class ContactMailer < ActionMailer::Base
  default from: "keitamori@gmail.com"
	
	def sample_mail(user)
		mail(from: "contact@studyquizz.fr" ,to: user.email , body: "Message de: #{user.email}\n #{user.message}")
	end

end
