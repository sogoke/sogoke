require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HomeHelper do
  describe "sogoke error message" do
    let(:user) { mock_model( User, errors: { name: "can't be blank", email: "can't be blank"  } ) }
    
    it "displays error message" do
      helper.sogoke_error_message(user).should == "can't be blankcan't be blank"
    end
  end
end
