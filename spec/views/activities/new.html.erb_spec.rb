require 'spec_helper'

describe "activities/new.html.erb" do
  before(:each) do
    assign(:activity, stub_model(Activity,
      :user_id => "MyString",
      :about_id => "MyString"
    ).as_new_record)
  end

  it "renders new activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => activities_path, :method => "post" do
      assert_select "input#activity_user_id", :name => "activity[user_id]"
      assert_select "input#activity_about_id", :name => "activity[about_id]"
    end
  end
end
