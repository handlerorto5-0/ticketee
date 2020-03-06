require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  scenario "with valid attributes" do
    FactoryGirl.create(:project, name: "NeoVim")

    visit "/"
    click_link "NeoVim"
    click_link "Edit Project"
    fill_in "Name", with: "NeoVim beta"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "NeoVim beta"
  end
end
