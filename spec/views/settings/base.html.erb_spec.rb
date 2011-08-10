require 'spec_helper'

describe "settings/base.html.erb" do
  it "contains a form" do
    view.stub!(:current_user).and_return(mock_model(User, email: "faker@gmail.com", gender: "male", signature: "", aboutme: "", website: "" ))
    view.stub!(:current_store).and_return(mock_model(Store, id: 5))

    render :template => "/settings/base.html.erb"

    rendered.should =~ /\/users\/settings\/base/
    rendered.should =~ /value="put"/
  end
end
