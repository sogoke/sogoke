require 'spec_helper'

describe "buzzs/index.html.erb" do
  before(:each) do
    assign(:buzzs, [
      stub_model(Buzz,
        :content => "Content",
        :user_id => "User"
      ),
      stub_model(Buzz,
        :content => "Content",
        :user_id => "User"
      )
    ])
  end

  it "renders a list of buzzs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Content".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
