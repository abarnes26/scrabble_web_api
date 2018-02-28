require 'rails_helper'

describe Validator do
  context "Initializes" do
    it "exists" do
      validator = Validator.new("word")

      expect(validator).to be_a Validator
    end

    it "can returns the root word if valid" do
      VCR.use_cassette("word_validator_model_valid") do
        response = Validator.new("words").validate_word

        expect(response).to eq("word")
      end
    end

    it "it returns 'invalid word' for invalid word" do
      VCR.use_cassette("word_validator_model_invalid") do
        response = Validator.new("Hosenpoydeodupe").validate_word

        expect(response).to eq("invalid word")
      end
    end
  end
end
