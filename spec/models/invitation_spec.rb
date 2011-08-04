require 'spec_helper'

describe Invitation do
  it "should be wrong if name is empty" do
      Invitation.new.should have(1).error_on(:name) 
    end

    it "should be wrong if email is empty" do
      Invitation.new.should have(2).error_on(:email)
    end

    it "should be wrong if email is invalid" do
      Invitation.new(:name => "alice", :email => "dkfj.com").should have(1).error_on(:email)
    end

    it "should be right" do
      Invitation.new(:name => "alice", :email => "fake@gmail.com").should have(0).error_on(:email)
    end
    
    it "should be wrong if name is taken" do
      Invitation.create :name => "alice", :email => "fake@gmail.com"
      Invitation.new(:name => "alice", :email => "fake@gmail.com").should have(1).error_on(:name)
    end
end
