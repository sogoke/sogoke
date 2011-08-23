require 'spec_helper'

describe "relations/show.html.erb" do
  before(:each) do
    @relation = assign(:relation, stub_model(Relation,
      :user_id => "User",
      :receiver_id => "Receiver"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Receiver/)
  end
end
