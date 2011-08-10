require 'spec_helper'

describe "stores/edit.html.erb" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
      :name => "MyString",
      :announcement => "MyString",
      :user_id => "MyString"
    ))
  end

  it "renders the edit store form"
end
