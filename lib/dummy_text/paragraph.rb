require 'dummy_text/text'

module DummyText
  class Paragraph < Text
    
    def initialize
    end
    
    def render(template)
      data = get_file_as_array(template)
      return data
    end
    
    def self.number_of_paragraphs(template)
      data = self.get_file_as_string(template)
      data.to_a.join.split("\n\n").size
    end

  end
end