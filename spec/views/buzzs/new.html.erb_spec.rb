require 'spec_helper'

describe "buzzs/new.html.erb" do
  before(:each) do
    assign(:buzz, stub_model(Buzz,
      :content => "MyString",
      :user_id => "MyString"
    ).as_new_record)
  end

  it "renders new buzz form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => buzzs_path, :method => "post" do
      assert_select "input#buzz_content", :name => "buzz[content]"
      assert_select "input#buzz_user_id", :name => "buzz[user_id]"
    end
  end
end
