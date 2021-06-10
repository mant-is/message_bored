class Link < ApplicationRecord
  validates :title, :url, presence: true
  IMAGE_FORMATS = %w(.jpg .jpeg .png .gif)

  def downvote
    increment!(:downvotes)
  end

  def image?
    url.end_with? *IMAGE_FORMATS  
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

