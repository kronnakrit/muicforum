class Topic < ActiveRecord::Base
	acts_as_taggable_on :keyword
	acts_as_votable

	belongs_to :user
	belongs_to :board
	has_many :comments , dependent: :destroy
	default_scope -> { order('updated_at DESC') }
	validates :title, presence: true, length: { maximum: 150 }
	validates :user_id, presence: true
	validates :board_id, presence: true
	validates :subtitle, presence: true
	

def self.search(search)
	if search  
    	where('title LIKE ?', "%#{search}%")  
    else  
     	scoped  
  	end  
end


end