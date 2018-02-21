class WordValidatorController < ApplicationController

  def validate
    response = Validator.new(word_params).validate_word
    unless response == "invalid word"
      root = response[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]
      flash[:notice] = "'#{word_params}' is a valid word and its root form is '#{root}'."
    else
      flash[:notice] = "'#{word_params}' is not a valid word."
    end
    redirect_to root_path
  end

  private
    def word_params
      params.require("query")
    end



end
