require 'spec_helper'

describe "stores/show.html.erb" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
      :name => "Name",
      :announcement => "Announcement",
      :user_id => "User"
    ))
  end

  it "renders attributes in <p>"
end
