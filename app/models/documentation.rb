class Documentation < ActiveRecord::Base
	has_attached_file :file
	validates_attachment :file, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet)}
end
