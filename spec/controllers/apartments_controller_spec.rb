require 'spec_helper'

describe ApartmentsController do

  def mock_apartment(stubs={})
    (@mock_apartment ||= mock_model(Apartment).as_null_object).tap do |apartment|
      apartment.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all apartments as @apartments" do
      Apartment.stub(:all) { [mock_apartment] }
      get :index
      assigns(:apartments).should eq([mock_apartment])
    end
  end

  describe "GET show" do
    it "assigns the requested apartment as @apartment" do
      Apartment.stub(:find).with("37") { mock_apartment }
      get :show, :id => "37"
      assigns(:apartment).should be(mock_apartment)
    end
  end

  describe "GET new" do
    it "assigns a new apartment as @apartment" do
      Apartment.stub(:new) { mock_apartment }
      get :new
      assigns(:apartment).should be(mock_apartment)
    end
  end

  describe "GET edit" do
    it "assigns the requested apartment as @apartment" do
      Apartment.stub(:find).with("37") { mock_apartment }
      get :edit, :id => "37"
      assigns(:apartment).should be(mock_apartment)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created apartment as @apartment" do
        Apartment.stub(:new).with({'these' => 'params'}) { mock_apartment(:save => true) }
        post :create, :apartment => {'these' => 'params'}
        assigns(:apartment).should be(mock_apartment)
      end

      it "redirects to the created apartment" do
        Apartment.stub(:new) { mock_apartment(:save => true) }
        post :create, :apartment => {}
        response.should redirect_to(apartment_url(mock_apartment))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved apartment as @apartment" do
        Apartment.stub(:new).with({'these' => 'params'}) { mock_apartment(:save => false) }
        post :create, :apartment => {'these' => 'params'}
        assigns(:apartment).should be(mock_apartment)
      end

      it "re-renders the 'new' template" do
        Apartment.stub(:new) { mock_apartment(:save => false) }
        post :create, :apartment => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested apartment" do
        Apartment.should_receive(:find).with("37") { mock_apartment }
        mock_apartment.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :apartment => {'these' => 'params'}
      end

      it "assigns the requested apartment as @apartment" do
        Apartment.stub(:find) { mock_apartment(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:apartment).should be(mock_apartment)
      end

      it "redirects to the apartment" do
        Apartment.stub(:find) { mock_apartment(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(apartment_url(mock_apartment))
      end
    end

    describe "with invalid params" do
      it "assigns the apartment as @apartment" do
        Apartment.stub(:find) { mock_apartment(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:apartment).should be(mock_apartment)
      end

      it "re-renders the 'edit' template" do
        Apartment.stub(:find) { mock_apartment(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested apartment" do
      Apartment.should_receive(:find).with("37") { mock_apartment }
      mock_apartment.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the apartments list" do
      Apartment.stub(:find) { mock_apartment }
      delete :destroy, :id => "1"
      response.should redirect_to(apartments_url)
    end
  end

end
