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
 
  def self.rank_links
    order(Arel.sql("upvotes - downvotes DESC"))
  end

end

