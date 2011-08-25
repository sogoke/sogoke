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

  it "renders a list of notifications"
end
