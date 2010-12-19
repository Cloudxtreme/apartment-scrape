require "spec_helper"

describe ApartmentsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/apartments" }.should route_to(:controller => "apartments", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/apartments/new" }.should route_to(:controller => "apartments", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/apartments/1" }.should route_to(:controller => "apartments", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/apartments/1/edit" }.should route_to(:controller => "apartments", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/apartments" }.should route_to(:controller => "apartments", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/apartments/1" }.should route_to(:controller => "apartments", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/apartments/1" }.should route_to(:controller => "apartments", :action => "destroy", :id => "1")
    end

  end
end
