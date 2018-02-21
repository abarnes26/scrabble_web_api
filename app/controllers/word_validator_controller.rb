class WordValidatorController < ApplicationController

  def validate
    Validator.new(word_params).validate_word

  end

  private
    def word_params
      params.require("query")
    end



end
