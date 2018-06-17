require "rails_helper"

feature "Sign Out" do
  include_context "current user signed in"

  let(:town) { create :town }
  let(:fishing) { create :event, title: "Fishing" }
  let(:concert) { create :event, title: "Mr.Default's concert", town: town }
  let(:concert) { create :event, title: "Default town birthday", town: town }

  scenario "User signs out" do
    visit town_events_path(town)

    expect(page).not_to have_content("Fishing")
    expect(page).to have_content("Mr.Default's concert")
    expect(page).to have_content("Default town birthday")
  end
end
