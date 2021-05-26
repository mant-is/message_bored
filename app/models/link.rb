class Link < ApplicationRecord
  validates :title, :url, presence: true
end

