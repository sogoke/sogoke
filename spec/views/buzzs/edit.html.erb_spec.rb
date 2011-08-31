require 'spec_helper'

describe "buzzs/edit.html.erb" do
  before(:each) do
    @buzz = assign(:buzz, stub_model(Buzz,
      :content => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit buzz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buzzs_path(@buzz), :method => "post" do
      assert_select "input#buzz_content", :name => "buzz[content]"
      assert_select "input#buzz_user_id", :name => "buzz[user_id]"
    end
  end
end
