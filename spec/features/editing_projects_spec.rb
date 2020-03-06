require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  before do
    FactoryGirl.create(:project, name: "NeoVim")

    visit "/"
    click_link "NeoVim"
    click_link "Edit Project"
  end
  scenario "with valid attributes" do
    fill_in "Name", with: "NeoVim beta"
    click_button "Update Project"

    expect(page).to have_content "Project has been updated."
    expect(page).to have_content "NeoVim beta"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Project"

    expect(page).to have_content "Project has not been updated."
  end
end
