require 'rails_helper'

RSpec.describe "user_payment_methods/show", type: :view do
  before(:each) do
    @user_payment_method = assign(:user_payment_method, UserPaymentMethod.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Line1/)
    expect(rendered).to match(/Line2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Country/)
  end
end
