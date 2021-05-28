class Link < ApplicationRecord
  validates :title, :url, presence: true

  def downvote
    increment!(:downvotes)
  end

  def upvote
    increment!(:upvotes)
  end

  def score
    upvotes - downvotes
  end 
 
end

