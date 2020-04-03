require "rails_helper"

RSpec.feature "User can veiw tickets" do
  before do
    sublime = FactoryGirl.create(:project, name: "Sublime Text 3")
    FactoryGirl.create(:ticket, project: sublime,
                      name: "Make it shiny!",
                      desctiption: "Gradients! Starbursts! Oh my!")
    ie = FactoryGirl.create(:project, name: "Internet Exporer")
    FactoryGirl.create(:ticket, project: ie,
                      name: "Standarts compliance",
                      desctiption: "Isn't a joke.")

    visit "/"
  end
  scenario "for a given project" do
    click_link "Sublime Text 3"
    expect(page).to have_content "Make it shiny!"
    expect(page).to_not have_content "Standarts comliance"

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content "Make it shiny!"
    end

    expect(page).to have_content "Gradients! Starbursts! Oh my!"
  end
end
