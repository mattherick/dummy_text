require 'dummy_text/text'

module DummyText
  class Word < Text
    
    def initialize
    end
    
    def render(count, template)
      data = get_file_as_array(template)
      data.join.split('. ').join.split[0...count].join(" ")
    end
    
    def self.number_of_words(template)
      data = self.get_file_as_string(template)
      data.scan(/(\w|-)+/).size
    end

  end
end