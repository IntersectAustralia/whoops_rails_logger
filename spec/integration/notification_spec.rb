require 'spec_helper'

describe "Notification" do
  include Capybara
  
  describe "exception notifications while a controller handles a request" do
    before(:all) do
      FakeWeb.register_uri(:post, "http://whoops.com/events/", :body => "success")
    end
    let(:last_request) { FakeWeb.last_request }
    
    it "sends a notification when an exception happens in a controller action" do
      visit users_path
      last_request.body.should include("exception in index")
    end
    
    it "sends a notification when an exception happens in a view"
    
    it "sends a notification when an exception happens in a model"
  end
  
end