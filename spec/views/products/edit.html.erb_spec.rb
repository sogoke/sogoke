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

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "input#product_description", :name => "product[description]"
      assert_select "input#product_price", :name => "product[price]"
      assert_select "input#product_sales_link", :name => "product[sales_link]"
      assert_select "input#product_sales_description", :name => "product[sales_description]"
    end
  end
end
