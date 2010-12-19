require 'spec_helper'

describe "apartments/index.html.erb" do
  before(:each) do
    assign(:apartments, [
      stub_model(Apartment,
        :title => "Title",
        :price => "9.99",
        :bedrooms => "Bedrooms",
        :address => "Address",
        :cats => false,
        :cats_deposit => "9.99",
        :cats_rent => "9.99",
        :parking => false,
        :parking_rent => "9.99",
        :laundry => false,
        :pros => "MyText",
        :cons => "MyText",
        :other => "MyText",
        :link => "Link"
      ),
      stub_model(Apartment,
        :title => "Title",
        :price => "9.99",
        :bedrooms => "Bedrooms",
        :address => "Address",
        :cats => false,
        :cats_deposit => "9.99",
        :cats_rent => "9.99",
        :parking => false,
        :parking_rent => "9.99",
        :laundry => false,
        :pros => "MyText",
        :cons => "MyText",
        :other => "MyText",
        :link => "Link"
      )
    ])
  end

  it "renders a list of apartments" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Bedrooms".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Link".to_s, :count => 2
  end
end
