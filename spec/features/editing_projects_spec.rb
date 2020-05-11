require "rails_helper"

RSpec.feature "Users can edit existing projects" do
  let(:user) {FactoryGirl.create(:user)}
  let(:project) {FactoryGirl.create(:project, name: "Vim")}

  before do
    login_as(user)
    assign_role!(user, :manager, project)

    visit "/"
    click_link "Vim"
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
