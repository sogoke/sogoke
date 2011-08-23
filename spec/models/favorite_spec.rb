require 'spec_helper'

describe Favorite do
  it "should be wrong if favorite_id is blank" do
    Favorite.new.should have(1).error_on(:favorite_id)
  end
  
  it "should be wrong if user_id is blank" do
    Favorite.new.should have(1).error_on(:user_id)
  end
end
