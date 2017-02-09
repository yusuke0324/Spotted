module ApplicationHelper
	require 'twilio-ruby'
	def send_sms(reservation)
		account_sid=ENV["twilid"]
		auth_token=ENV["twiltoken"]

		@client = Twilio::REST::Client.new account_sid, auth_token

		owner_phone = reservation.spot.owner.phone.gsub(/\A"(.*)"\Z/m, '\1')
		reservation_name = reservation.current_user.first_name.gsub(/\A"(.*)"\Z/m, '\1')

		@client.messages.create(
			  from: '+16125004243',
			  to: '+1' + owner_phone,
			  body: "#{reservation_name} just reserved your spot!",
			  media_url: 'http://www.drodd.com/images12/smiley-face-clip-art15.jpg'
			)

	end
end
