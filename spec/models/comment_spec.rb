require 'spec_helper'

describe Comment do
  it "should be wrong if content is blank" do
    Comment.new.should have(1).errors_on(:content)
  end
  
  it "should be wrong if about_id is blank" do
    Comment.new.should have(1).errors_on(:about_id)
  end
  
  it "should be wrong if user_id is blank" do
    Comment.new.should have(1).errors_on(:user_id)
  end
end
