require 'spec_helper'

describe "notifications/edit.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :user_id => "MyString",
      :sogoke_id => "MyString"
    ))
  end

  it "renders the edit notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path(@notification), :method => "post" do
      assert_select "input#notification_user_id", :name => "notification[user_id]"
      assert_select "input#notification_sogoke_id", :name => "notification[sogoke_id]"
    end
  end
end
