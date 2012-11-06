require 'spec_helper'

describe MainController do
  describe "GET Index" do
    it "gets the index view" do
      get "index"
      response.status.should be 200
    end
  end
end