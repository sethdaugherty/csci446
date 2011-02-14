class Author < ActiveRecord::Base
	has_attached_file :photo
	has_many :articles

	validate :no_sally

	def no_sally
		errors.add(:author, 'can\'t be Sally') if name =~ /\b[Ss]ally\b/
	end
end
