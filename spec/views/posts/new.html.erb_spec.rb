require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title => "MyString",
      :content => "MyString",
      :user_id => "MyString"
    ).as_new_record)
  end

  it "renders new post form"
end
