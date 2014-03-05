class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  default_scope -> { order('created_at ASC') }
  validates :user_id, presence: true
end
