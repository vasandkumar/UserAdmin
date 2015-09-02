class User < ActiveRecord::Base

validates :sapid, presence: true, uniqueness: true
validates :fname, presence: true
validates :lname, presence: true
validates :email, presence: true, uniqueness: true
validates :mobile, presence: true, uniqueness: true, :length => { :maximum => 12, :minimum => 10 }
validates :username, presence: true, uniqueness: true


has_many :pics, :dependent => :destroy
has_one :profile, :dependent => :destroy

end
