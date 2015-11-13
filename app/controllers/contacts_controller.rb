class ContactsController < ApplicationController
  def message
  end
	
	def send_message
		ContactMailer.sample_mail(message_params).deliver
		redirect_to root_path , notice: 'Votre mail à été envoyé'
	end

	private

	def message_params
		params.permit(:name, :email, :message)
	end

end
