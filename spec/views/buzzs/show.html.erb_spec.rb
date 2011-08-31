require 'spec_helper'

describe "buzzs/show.html.erb" do
  before(:each) do
    @buzz = assign(:buzz, stub_model(Buzz,
      :content => "Content",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Content/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
  end
end
