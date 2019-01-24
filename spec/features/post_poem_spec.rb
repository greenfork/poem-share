require 'rails_helper'

RSpec.feature "Posting a poem on home page", type: :feature do
  context "with the number of symbols UNDER the limit" do
    let(:poem) { 'this is a short poem' }
    scenario "should be successful" do
      visit root_path
      within('form') do
        fill_in 'poem', with: poem
      end
      click_button 'Publish!'
      expect(page).to have_content('You can copy the link from your browser')
      expect(page).to have_content(poem)
    end
  end

  context "with the number of symbols OVER the limit" do
    let(:poem) { 'this is a long poem' * 100 }
    scenario "should fail and stay on the page with a disabled button" do
      visit root_path
      within('form') do
        fill_in 'poem', with: poem
      end
      click_button 'Publish!'
      expect(page).not_to have_content('You can copy the link from your browser')
    end
  end
end
