require 'spec_helper'

feature "Smoke Test", js: true do

  scenario "root page show have title" do
    visit root_path
    page_has_title "Alles"
  end

  scenario "go to user page" do
    client = Client.create! first_name: "John", last_name: "Doe"
    visit root_path
    click_link client.full_name
    page_has_title client.full_name
  end

  def page_has_title(title)
    within "h1" do
      page.should have_content title
    end
  end
end
