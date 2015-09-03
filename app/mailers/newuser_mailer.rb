class NewuserMailer < ApplicationMailer

	default from: "noreply@useradmin.com"

	def new_user_email(user)
		@user = user
		mail(to: @user.email,subject: 'New User Registered')
	end
	
end
