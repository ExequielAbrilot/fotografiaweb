class Authentication < ActiveRecord::Base
	belongs_to :user #user_id
end
