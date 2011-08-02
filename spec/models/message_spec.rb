require 'spec_helper'

describe Message do
  it "should be wrong if title is empty" do
    Message.new.should have(1).error_on(:title) 
  end

  it "should be wrong if content is empty" do
    Message.new.should have(1).error_on(:content)
  end

  it "should be wrong if receiver is invalid"
end
