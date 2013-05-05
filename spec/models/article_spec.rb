require 'spec_helper'

describe Article do
  it 'can be initialized' do
    article = Article.new
    article.should_not be_persisted
  end

  describe '.published' do
    before :each do
      @published = Fabricate(:article, published: true)
      @unpublished = Fabricate(:article, published: false)
    end

    it 'finds all published' do
      Article.published.to_a.should == [@published]
    end
  end
end
