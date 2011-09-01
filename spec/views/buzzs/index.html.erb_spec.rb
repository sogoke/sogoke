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

  it "renders a list of buzzs"
end
