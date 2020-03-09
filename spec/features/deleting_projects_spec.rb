require "rails_helper"

RSpec.feature "Users  can selete projects" do
  scenario "successfully" do
    FactoryGirl.create(:project, name: "Barbambia")
    visit "/"
    click_link "Barbambia"
    click_link "Delete Project"

    expect(page).to have_content "Project has been deleted."
    expect(page.current_url).to eq projects_url
    expect(page).to have_no_content "Berbambia"
  end
end
