require 'dummy_text/text'

module DummyText
  class Character < Text
    
    def initialize
    end
    
    def render(count, template)
      data = get_file_as_array(template)
      data.join(" ").chars.to_a[0...count].join
    end
    
    def self.number_of_characters(template)
      data = self.get_file_as_string(template)
      data.size
    end

  end
end