require 'spec_helper'

describe "buzzs/show.html.erb" do
  before(:each) do
    @buzz = assign(:buzz, stub_model(Buzz,
      :content => "Content",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>"
end
