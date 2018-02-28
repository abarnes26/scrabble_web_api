class Validator

  def initialize(word)
    @word = word
  end

  def validate_word
    handle_validation(OxfordServices.new(word).validate)
  end

  def handle_validation(response)
    if response == "invalid word"
      response
    else
      response[:results][0][:lexicalEntries][0][:inflectionOf][0][:id]
    end
  end

  private
    attr_reader :word

end
