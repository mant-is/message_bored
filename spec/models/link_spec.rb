require 'rails_helper'

RSpec.describe Link, 'validations' do

  it { expect(subject).to validate_presence_of(:title) }  
  it { expect(subject).to validate_presence_of(:url) }  

end

RSpec.describe Link, '.rank_links' do
  it 'returns the links ascending based on score' do
    middle_rank = create(:link, upvotes: 5, downvotes: 2)
    bottom_rank = create(:link, upvotes: 2, downvotes: 4)
    top_rank = create(:link, upvotes: 9, downvotes: 2)

    expect(Link.rank_links).to eq [top_rank, middle_rank, bottom_rank]
  end
end

RSpec.describe Link, '#downvote' do
  it 'increments downvotes' do
    link = build(:link, downvotes: 1)
    link.downvote

    expect(link.downvotes).to eq 2
  end
end

RSpec.describe Link, '#upvote' do
  it 'increments upvotes' do
    link = build(:link, upvotes: 1)
    link.upvote

    expect(link.upvotes).to eq 2
  end
end

RSpec.describe Link, '#score' do

  it 'returns the difference between its upvotes and downvotes' do
    link = build(:link, upvotes: 4, downvotes: 5)
    expect(link.score).to eq -1
  end

end

RSpec.describe Link, '#image?' do
  %w(.jpg .png .gif).each do |extension|
    it "returns true if the url ends in #{ extension }" do
      link = Link.new(url: "www.foobar.com/a#{ extension }")

      expect(link.image?).to be_truthy
    end

    it 'returns false if the url does not have an image extension' do
      link = Link.new(url: "www.foobar.com/")
      expect(link.image?).to be_falsey
    end
  end
end
