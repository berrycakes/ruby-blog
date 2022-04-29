require 'rails_helper'

RSpec.describe "user_payment_methods/edit", type: :view do
  before(:each) do
    @user_payment_method = assign(:user_payment_method, UserPaymentMethod.create!(
      user: nil,
      name: "MyString",
      email: "MyString",
      phone: "MyString",
      line1: "MyString",
      line2: "MyString",
      city: "MyString",
      state: "MyString",
      postal_code: 1,
      country: "MyString"
    ))
  end

  it "renders the edit user_payment_method form" do
    render

    assert_select "form[action=?][method=?]", user_payment_method_path(@user_payment_method), "post" do

      assert_select "input[name=?]", "user_payment_method[user_id]"

      assert_select "input[name=?]", "user_payment_method[name]"

      assert_select "input[name=?]", "user_payment_method[email]"

      assert_select "input[name=?]", "user_payment_method[phone]"

      assert_select "input[name=?]", "user_payment_method[line1]"

      assert_select "input[name=?]", "user_payment_method[line2]"

      assert_select "input[name=?]", "user_payment_method[city]"

      assert_select "input[name=?]", "user_payment_method[state]"

      assert_select "input[name=?]", "user_payment_method[postal_code]"

      assert_select "input[name=?]", "user_payment_method[country]"
    end
  end
end
