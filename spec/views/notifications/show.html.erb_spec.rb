require 'spec_helper'

describe "notifications/show.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :user_id => "User",
      :sogoke_id => "Sogoke"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sogoke/)
  end
end
