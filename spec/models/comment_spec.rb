require 'spec_helper'

describe Comment do
  it "should be wrong if content is blank" do
    Comment.new.should have(1).errors_on(:content)
  end
end
