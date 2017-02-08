module ApplicationHelper
	require 'twilio-ruby'
	def send_sms(reservation)
		account_sid=ENV["twilid"]
		auth_token=ENV["twiltoken"]

		@client = Twilio::REST::Client.new account_sid, auth_token

		@client.messages.create(
			  from: '+16125004243',
			  to: '+1reservation.spot.owner.phone',
			  body: 'reservation.spot.user.phone just reserved your spot!',
			  media_url: 'http://www.drodd.com/images12/smiley-face-clip-art15.jpg'
			)

	end
end
