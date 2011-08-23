require 'spec_helper'

describe "notifications/new.html.erb" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :user_id => "MyString",
      :sogoke_id => "MyString"
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path, :method => "post" do
      assert_select "input#notification_user_id", :name => "notification[user_id]"
      assert_select "input#notification_sogoke_id", :name => "notification[sogoke_id]"
    end
  end
end
