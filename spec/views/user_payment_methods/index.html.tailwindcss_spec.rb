require 'rails_helper'

RSpec.describe "user_payment_methods/index", type: :view do
  before(:each) do
    assign(:user_payment_methods, [
      UserPaymentMethod.create!(
        user: nil,
        name: "Name",
        email: "Email",
        phone: "Phone",
        line1: "Line1",
        line2: "Line2",
        city: "City",
        state: "State",
        postal_code: 2,
        country: "Country"
      ),
      UserPaymentMethod.create!(
        user: nil,
        name: "Name",
        email: "Email",
        phone: "Phone",
        line1: "Line1",
        line2: "Line2",
        city: "City",
        state: "State",
        postal_code: 2,
        country: "Country"
      )
    ])
  end

  it "renders a list of user_payment_methods" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
    assert_select "tr>td", text: "Line1".to_s, count: 2
    assert_select "tr>td", text: "Line2".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "State".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Country".to_s, count: 2
  end
end
