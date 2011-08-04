require 'spec_helper'

describe "messages/index.html.erb" do
  before(:each) do
    assign(:messages, [
      stub_model(Message,
        :title => "Title",
        :from => "From",
        :to => "To",
        :content => "MyText"
      ),
      stub_model(Message,
        :title => "Title",
        :from => "From",
        :to => "To",
        :content => "MyText"
      )
    ])
  end

  it "renders a list of messages"
end
