require 'spec_helper'

describe "Messages" do
  it "should be wrong if content is blank" do
    Message.new.should have(1).error_on(:title)
  end
  
  it "should be wrong if title is blank" do
    Message.new.should have(1).error_on(:content)
  end
  
  it "is marked as read" do
    message = Factory.build(:message)
    message.unread.should eq(true)
    message.read!
    message.unread.should eq(false)
  end
end
