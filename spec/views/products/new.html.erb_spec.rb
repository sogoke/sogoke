require 'spec_helper'

describe "products/new.html.erb" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyString",
      :price => 1.5,
      :sales_link => "MyString",
      :sales_description => "MyString"
    ).as_new_record)
  end

  pending "renders new product form"
end
