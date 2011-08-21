require 'spec_helper'

describe "preferences/edit.html.erb" do
  before(:each) do
    @preference = assign(:preference, stub_model(Preference,
      :mail_on_receiving_message => false,
      :mail_on_being_followed => false,
      :message_from_everyone => false
    ))
  end

  it "renders the edit preference form"
end
