require 'spec_helper'

describe "posts/index.html.erb" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :content => "Content",
        :user_id => "User"
      ),
      stub_model(Post,
        :title => "Title",
        :content => "Content",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of posts"
end
