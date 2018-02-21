class Validator

  def initialize(word)
    @word = word
  end

  def validate_word
    OxfordServices.new(word).validate
  end

  private
    attr_reader :word

end
