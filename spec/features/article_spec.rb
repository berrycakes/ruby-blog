require 'rails_helper'
# https://github.com/teamcapybara/capybara#using-capybara-with-rspec

RSpec.describe "Articles", type: :feature do 
    describe 'View all articles' do
        before {visit articles_path}

        it 'shows all articles in the body' do
            # within the <body>
            # check capybara with rspec docs
            within 'body' do
                expect(page).to have_content('Articles#index')
                # expect(page).to have_content('New Article')
            end
        end
    end

    describe 'Articles form' do
        before {visit new_articles_path}
        context 'when all fields are valid' do
            
        it 'submits form' do
                fill_in 'Title', with: 'usertitle'
                fill_in 'Content', with: 'content here'
                click_button 'Submit'

                expect(page).to have_content('notice message here')
            end
        end
    end
end