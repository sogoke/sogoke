require 'spec_helper'

describe Message do
  it "should be wrong if title is empty" do
    Message.new.should have(1).error_on(:title) 
  end

  it "should be wrong if content is empty" do
    Message.new.should have(1).error_on(:content)
  end

  it "should be wrong if receiver is valid" do
    User.create! name: "prajnamas", password: "111111", email: "fakeprajnamas@gmail.com"
    Message.new(title: "hello", content: "message", receiver_name: "prajnamas").should have(0).error_on(:receiver_id)
  end
  
  it "should be read after call read!" do
    User.create! name: "prajnamas", password: "111111", email: "fakeprajnamas@gmail.com"
    m = Message.create!(title: "hello", content: "message", receiver_name: "prajnamas")
    m.read!
    m.unread.should == false
  end
end
