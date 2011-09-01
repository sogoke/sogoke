require 'spec_helper'

describe ActivityObserver do
  describe "create activity after save" do
    let(:observer) { ActivityObserver.instance }
    let(:user) { Factory.create(:user) }
    let(:article) { user.articles.build(title: "Hello", content: "World") }
    

    it "creates activity after successfully created article" do
      observer.after_save(article)
      user.activities.count.should eq(1)
    end 
  end
end
