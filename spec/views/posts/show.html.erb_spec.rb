require 'spec_helper'

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "Title",
      :content => "Content",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>"
end
