require "rails_helper"

RSpec.feature "Users can view projects" do
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: "NeoVim")

    visit "/"
    click_link "NeoVim"
    expect(page.current_url).to eq project_url(project)
  end
end
