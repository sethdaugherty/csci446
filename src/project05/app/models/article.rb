class Article < ActiveRecord::Base
    
    validates_presence_of :title, :author, :body

    validate :no_sally

    def no_sally
        errors.add(:author, 'can\'t be Sally') if author =~ /\b[Ss]ally\b/
    end

end
