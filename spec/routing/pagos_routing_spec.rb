require "rails_helper"

RSpec.describe PagosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pagos").to route_to("pagos#index")
    end


    it "routes to #show" do
      expect(:get => "/pagos/1").to route_to("pagos#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pagos").to route_to("pagos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pagos/1").to route_to("pagos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pagos/1").to route_to("pagos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pagos/1").to route_to("pagos#destroy", :id => "1")
    end

  end
end
