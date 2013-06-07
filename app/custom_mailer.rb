require "action_mailer"

class CustomMailer < ActionMailer::Base
	def notification(to_email, from_email = "from_email@example.com")
		mail(to: to_email, from: from_email, subject: "Email notification through Ruby") do |format|
			format.text
			format.html
		end
	end

end

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.smtp_settings = {
	:address 		=> "smtp.gmail.com",
	:port 			=> 587,
	:domain			 => "domain",
	:authentication => :plain,
	:user_name => "username",
	:password => "password",
  :enable_starttls_auto => true
}


ActionMailer::Base.view_paths =  File.expand_path('../../app/views/', __FILE__)

CustomMailer.notification("sendemail@example.com").deliver