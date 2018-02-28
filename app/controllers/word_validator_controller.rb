class WordValidatorController < ApplicationController

  def validate
    response = Validator.new(word_params).validate_word
    if response == "invalid word"
      flash[:notice] = "'#{word_params}' is not a valid word."
    else
      flash[:notice] = "'#{word_params}' is a valid word and its root form is '#{response}'."
    end
    redirect_to root_path
  end

  private
    def word_params
      params.require("query")
    end

end
