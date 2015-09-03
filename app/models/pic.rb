class Pic < ActiveRecord::Base



	has_attached_file :picture,
					  :styles => {
                      	:thumb => "40x40>",
                      	:small => "150x150>",
                      	:thumbnail => "242x200>"
                    	}

	validates :imageuri, presence: true
	validates :picture, :attachment_presence => true
    validates_attachment_content_type :picture, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	belongs_to :user
end
