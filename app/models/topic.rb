class Topic < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  has_many :comments , dependent: :destroy
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true, length: { maximum: 120 }
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :subtitle, presence: true
end
