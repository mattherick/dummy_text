require 'dummy_text/text'

module DummyText
  class Sentence < Text

    def initialize
    end
    
    def render(count, template)
      data = get_file_as_array(template)
      sentences = data.join.split('.')
      s = sentences[0...count].join(".") + "."
      return s
    end
    
    def self.number_of_sentences(template)
      data = self.get_file_as_string(template)
      data.split(".").size
    end

  end
end