class Article < ActiveRecord::Base
    
    validates_presence_of :title, :author, :body

    validate :no_sally

		belongs_to :author

    def no_sally
				# This is the regex I want to use... it wont let in "sally", but
				# it allows an author named "sallyanna", which is probably not the
				# Sally the boss is talking about
        errors.add(:author, 'can\'t be Sally') if author =~ /\b[Ss]ally\b/
    end

end
