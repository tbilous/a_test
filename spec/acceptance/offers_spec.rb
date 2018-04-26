require 'acceptance_helper'

feature 'Manage offers', %q{
  In order to create/update offer
} do

  context 'all users see nav new offers in real-time', js: true do
    let!(:offers) { create_list(:offer, 5) }

    scenario 'In order to create/update offer' do
      Capybara.using_session('writer') do
        visit root_path
      end

      Capybara.using_session('reader') do
        visit root_path
      end

      Capybara.using_session('writer') do
        within '#new_offer' do
          fill_in 'offer_name', with: 'name'
          fill_in 'offer_advertiser', with: 'advertiser 01'
          fill_in 'offer_payout', with: '1.25'
          click_button 'submit'
          wait_animation
        end
        within '#offers' do
          expect(page).to have_content('name')
          expect(page).to have_content('advertiser 01')
          expect(page).to have_content('1.25')
        end
        within '#new_offer' do
          expect(page).to_not have_content('name')
          expect(page).to_not have_content('advertiser 01')
          expect(page).to_not have_content('1.25')
        end
      end

      Capybara.using_session('reader') do
        within '#offers' do
          expect(page).to have_content('name')
          expect(page).to have_content('advertiser 01')
          expect(page).to have_content('1.25')
        end
      end
      Capybara.using_session('writer') do
        within "#offerId#{offers.last.id}" do
          click_link 'edit'

          expect(page).to_not have_content('edit')

          fill_in 'offer_name', with: 'name 2'
          fill_in 'offer_advertiser', with: 'advertiser 2'
          fill_in 'offer_payout', with: '3.25'
          click_button 'submit'
          wait_animation
        end

        within "#offerId#{offers.last.id}" do
          expect(page).to_not have_content(offers.last.name)
          expect(page).to_not have_content(offers.last.advertiser)
          expect(page).to_not have_content(offers.last.payout)
          expect(page).to_not have_content('submit')
          expect(page).to have_content('edit')
        end
      end
      Capybara.using_session('reader') do
        within "#offerId#{offers.last.id}" do
          expect(page).to_not have_content(offers.last.name)
          expect(page).to_not have_content(offers.last.advertiser)
          expect(page).to_not have_content(offers.last.payout)
          expect(page).to_not have_content('submit')
          expect(page).to have_content('edit')
        end
      end
    end
  end
end
