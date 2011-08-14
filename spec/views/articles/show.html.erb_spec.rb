require 'spec_helper'

describe "articles/show.html.erb" do
  before(:each) do
    @article = assign(:article, stub_model(Article,
      :title => "Title",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>"
end
