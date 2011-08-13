require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "is wrong if title is nil" do
      Article.new.should have(1).error_on(:title)
    end
    
    it "is wrong if content is nil" do
      Article.new.should have(1).error_on(:content)
    end
  end
end
