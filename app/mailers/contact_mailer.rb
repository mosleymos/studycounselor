class ContactMailer < ActionMailer::Base
  default from: "keitamori@gmail.com"
	
	def sample_mail(user)
		@user = user
		mail(from: "keitamori@gmail.com" ,to: "keitamori@gmail.com" , body: "Message de: #{@user[:email]}\n #{@user[:message]}")
	end
end
