require 'rails_helper'

describe "When a user visits the home page" do
  context "They enter a valid word in the word validator" do
    it "should inform them that it is a valid word" do
      VCR.use_cassette("user_searches_valid_word") do
        visit '/'

        fill_in "query", with: 'ponies'
        click_button('Validate Word')

        expect(current_path).to eq(root_path)
        expect(page).to have_content "'ponies' is a valid word and its root form is 'pony'."
      end
    end
  end

  context "They enter an invalid word in the word validator" do
    xit "should inform them that it is an invalid word" do
      visit '/'

      find('.word_validator').set('farplesnump')
      click_button('Validate Word')

      expect(current_path).to eq(root_path)
      expect(page).to have_content "'farplesnump' is not a valid word."
    end
  end

end

# As a user
# When I visit "/"
# And I fill in a text box with "foxes"
# And I click "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
