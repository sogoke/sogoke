require 'spec_helper'

describe "products/edit.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :price => 1.5,
      :sales_link => "MyString",
      :sales_description => "MyString"
    ))
  end

  it "renders the edit product form"
end
