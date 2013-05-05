require 'spec_helper'

describe "articles/preview" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      title: "Title",
      content: "MyText"
    ))
  end

  it "renders attributes in this page" do
    render
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
