require 'spec_helper'

describe "messages/new.html.erb" do
  before(:each) do
    assign(:message, stub_model(Message,
      :title => "MyString",
      :from => "MyString",
      :to => "MyString",
      :content => "MyText"
    ).as_new_record)
  end

  it "renders new message form"
end
