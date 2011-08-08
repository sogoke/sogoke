require 'spec_helper'

describe SettingsController do

  describe "GET 'base'" do
    it "should be successful" do
      get 'base'
      response.should be_success
    end
  end

  describe "GET 'notification'" do
    it "should be successful" do
      get 'notification'
      response.should be_success
    end
  end

  describe "GET 'binding'" do
    it "should be successful" do
      get 'binding'
      response.should be_success
    end
  end

  describe "GET 'store'" do
    it "should be successful" do
      get 'store'
      response.should be_success
    end
  end

end
