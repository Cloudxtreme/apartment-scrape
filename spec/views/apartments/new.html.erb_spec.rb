require 'spec_helper'

describe "apartments/new.html.erb" do
  before(:each) do
    assign(:apartment, stub_model(Apartment,
      :title => "MyString",
      :price => "9.99",
      :bedrooms => "MyString",
      :address => "MyString",
      :cats => false,
      :cats_deposit => "9.99",
      :cats_rent => "9.99",
      :parking => false,
      :parking_rent => "9.99",
      :laundry => false,
      :pros => "MyText",
      :cons => "MyText",
      :other => "MyText",
      :link => "MyString"
    ).as_new_record)
  end

  it "renders new apartment form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => apartments_path, :method => "post" do
      assert_select "input#apartment_title", :name => "apartment[title]"
      assert_select "input#apartment_price", :name => "apartment[price]"
      assert_select "input#apartment_bedrooms", :name => "apartment[bedrooms]"
      assert_select "input#apartment_address", :name => "apartment[address]"
      assert_select "input#apartment_cats", :name => "apartment[cats]"
      assert_select "input#apartment_cats_deposit", :name => "apartment[cats_deposit]"
      assert_select "input#apartment_cats_rent", :name => "apartment[cats_rent]"
      assert_select "input#apartment_parking", :name => "apartment[parking]"
      assert_select "input#apartment_parking_rent", :name => "apartment[parking_rent]"
      assert_select "input#apartment_laundry", :name => "apartment[laundry]"
      assert_select "textarea#apartment_pros", :name => "apartment[pros]"
      assert_select "textarea#apartment_cons", :name => "apartment[cons]"
      assert_select "textarea#apartment_other", :name => "apartment[other]"
      assert_select "input#apartment_link", :name => "apartment[link]"
    end
  end
end
