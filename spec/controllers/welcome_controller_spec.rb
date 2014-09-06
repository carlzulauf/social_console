require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
  describe "#index" do
    it "should respond with success" do
      get :index
      expect(response).to be_success
    end
  end
end
