class Post < ActiveRecord::Base
  attr_accessible :text, :title

  validates :title, :presence => true, :length => { :minimum => 5, :maximum => 25 }
  def self.search( search )
    if search
      find( :all, :conditions => ['title LIKE ? OR text LIKE ?', "%#{search}%", "%#{search}%" ] )
    else
      find( :all )
    end
  end

  has_many :comments, :dependent => :destroy
end
