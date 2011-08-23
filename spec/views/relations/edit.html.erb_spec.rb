require 'spec_helper'

describe "relations/edit.html.erb" do
  before(:each) do
    @relation = assign(:relation, stub_model(Relation,
      :user_id => "MyString",
      :receiver_id => "MyString"
    ))
  end

  it "renders the edit relation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => relations_path(@relation), :method => "post" do
      assert_select "input#relation_user_id", :name => "relation[user_id]"
      assert_select "input#relation_receiver_id", :name => "relation[receiver_id]"
    end
  end
end
