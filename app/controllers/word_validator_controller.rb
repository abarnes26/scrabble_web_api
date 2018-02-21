class WordValidatorController < ApplicationController

  def validate
    response = Validator.new(word_params).validate_word
    binding.pry
    root = response[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]

  end

  private
    def word_params
      params.require("query")
    end



end
