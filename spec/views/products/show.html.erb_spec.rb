require 'spec_helper'

describe "products/show.html.erb" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "Name",
      :description => "Description",
      :price => 1.5,
      :sales_link => "Sales Link",
      :sales_description => "Sales Description"
    ))
  end

  it "renders attributes in <p>"
end
