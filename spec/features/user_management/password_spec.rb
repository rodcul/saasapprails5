require "rails_helper"

RSpec.feature "Password", type: :feature do
  login_user

  it "should be able to visit my_password" do
    visit my_password_path

    expect(current_path).to eql(my_password_path)
  end

  it "should edit my password successfully" do
    visit my_password_path

    within "#edit_user_#{@user.id}" do
      fill_in "user_password", with: "pass123"
      fill_in "user_password_confirmation", with: "pass123"
    end

    click_button("Update My Password")
    expect(current_path).to eql(my_password_path)
  end

  it "and fail to edit my password successfully" do
    visit my_password_path

    within "#edit_user_#{@user.id}" do
      fill_in "user_password", with: "Test"
      fill_in "user_password_confirmation", with: ""
    end

    click_button("Update My Password")
    expect(current_path).to eql(my_update_password_path)
    expect(page).to have_content("error")
  end
end