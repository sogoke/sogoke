require 'spec_helper'

describe "posts/edit.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "MyString",
      :content => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit post form"
end
