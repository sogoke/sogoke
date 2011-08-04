require 'spec_helper'

describe User do
  it "should be wrong if name is blank" do
    User.new.should have(1).errors_on(:name)
  end
  
  it "should be wrong if email is blank" do
    User.new.should have(3).errors_on(:email)
  end
  
  it "should be wrong if email is invalid" do
    User.new(:email => "fakel.com").should have(2).errors_on(:email)
  end
end
