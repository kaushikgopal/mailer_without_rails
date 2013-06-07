require "action_mailer"


EMAIL = YAML.load_file(Dir.pwd + '/app/email_address.yml')

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = YAML.load_file(Dir.pwd + '/app/smtp.yml')
ActionMailer::Base.view_paths =  File.expand_path('../views/', __FILE__)


class CustomMailer < ActionMailer::Base
	def notification(to_email, from_email = EMAIL[:from])
		mail(to: to_email, from: from_email, subject: "Email notification through Ruby - now with YAML") do |format|
			format.text
			format.html
		end
	end
end


CustomMailer.notification(EMAIL[:to]).deliver