require 'spec_helper'

describe Article do
  it "should be wrong if title is blank" do
    Article.new.should have(1).error_on(:title)
  end
  
  it "should be wrong if user_id is blank" do
    Article.new.should have(1).error_on(:user_id)
  end
  
  it "should be wrong if content is blank" do
    Article.new.should have(1).error_on(:content)
  end
end
