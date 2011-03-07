class User < ActiveRecord::Base
  belongs_to :role
  has_many :games
  has_attached_file :photo, :default_url => "/images/missing.png"
  acts_as_authentic
  
  def role_symbols
    if role != nil
      return [role.name.to_sym]
    else
      return []
    end
  end
 
  def full_name
    return fname + " " + lname
  end

end
