require 'spec_helper'

describe "messages/show.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :title => "Title",
      :from => "From",
      :to => "To",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>"
end
