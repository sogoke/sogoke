require 'spec_helper'

describe Category do
  it "should be wrong if name is blank" do
    Category.new.should have(1).error_on(:name)
  end
  
  it "should be wrong if name is taken" do
    Factory.create :category
    Category.new(name: "Wood").should have(1).error_on(:name)
  end
end
