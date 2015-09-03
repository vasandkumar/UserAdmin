class User < ActiveRecord::Base

	after_save :send_new_user_mail

validates :sapid, presence: true, uniqueness: true
validates :fname, presence: true
validates :lname, presence: true
validates :email, presence: true, uniqueness: true
validates :mobile, presence: true, uniqueness: true, :length => { :maximum => 12, :minimum => 10 }
validates :username, presence: true, uniqueness: true


has_many :pics,-> { order 'created_at desc' }, :dependent => :destroy
has_one :profile, :dependent => :destroy

def send_new_user_mail()
	NewuserMailer.new_user_email(self).deliver_now
end


end
