require 'spec_helper'

describe "notifications/index.html.erb" do
  before(:each) do
    assign(:notifications, [
      stub_model(Notification,
        :user_id => "User",
        :sogoke_id => "Sogoke"
      ),
      stub_model(Notification,
        :user_id => "User",
        :sogoke_id => "Sogoke"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sogoke".to_s, :count => 2
  end
end
