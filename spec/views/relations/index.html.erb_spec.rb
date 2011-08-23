require 'spec_helper'

describe "relations/index.html.erb" do
  before(:each) do
    assign(:relations, [
      stub_model(Relation,
        :user_id => "User",
        :receiver_id => "Receiver"
      ),
      stub_model(Relation,
        :user_id => "User",
        :receiver_id => "Receiver"
      )
    ])
  end

  it "renders a list of relations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Receiver".to_s, :count => 2
  end
end
