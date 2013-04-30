require 'spec_helper'

describe "articles/index" do
  before(:each) do
    9.times { Fabricate(:article) }
    assign(:articles, Article.page)
  end

  it "renders a list of articles" do
    render
    assert_select "tr td", text: /Article/, count: 9
    assert_select "tr td", text: /article_/, count: 9
  end
end
