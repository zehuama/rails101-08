class Post < ApplicationRecord
  belongs_to :group, counter_cache: true
  belongs_to :user
  validates :content, presence: true

  scope :recent, -> {order("updated_at DESC")}
end
