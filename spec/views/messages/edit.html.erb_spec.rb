require 'spec_helper'

describe "messages/edit.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :title => "MyString",
      :from => "MyString",
      :to => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit message form"
end
