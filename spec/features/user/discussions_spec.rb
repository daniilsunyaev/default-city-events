require "rails_helper"

feature "Event topic discussion page" do
  include_context "current user signed in"

  let!(:event) { create :event, title: "Boris Moiseev performance" }
  let!(:flame) { create :topic, name: "Flaming" }

  let!(:tickets) { create :topic, name: "Tickets" }

  let(:flame_discussion) do
    create :discussion, event: event, topic: flame
  end

  let(:tickets_discussion) do
    create :discussion, event: event, topic: tickets
  end

  let!(:haters_comment) do
    create :comment,
      text: "HATEHATEHATE",
      event: event,
      discussion: flame_discussion
  end

  let!(:admiers_comment) do
    create :comment,
      text: "LOVELOVELOVE",
      event: event,
      discussion: flame_discussion
  end

  let!(:question_comment) do
    create :comment,
      text: "How much?",
      event: event,
      discussion: tickets_discussion
  end

  scenario "User visits event's topic page and leaves a comment" do
    visit discussion_path(flame_discussion)

    expect(page).to have_content("Flaming")
    expect(page).to have_content("HATEHATEHATE")
    expect(page).to have_content("LOVELOVELOVE")
    expect(page).not_to have_content("How much?")

    fill_in "comment_text", with: "I'd like to flame a bit too"
    click_button "Save Comment"

    expect(page).to have_content("I'd like to flame a bit too")
  end
end
