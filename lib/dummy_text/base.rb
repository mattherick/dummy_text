module DummyText
  module Base

    class WrongFormat < StandardError; end
    class TooMuchError < StandardError; end
    
    def dummy_text(arg)
      if /(\d+)([c|w|s|p])/i.match(arg)
        count = $1.to_i
        
        case $2.downcase
          when "c" then character(count)
          when "w" then word(count)
          when "s" then sentence(count)
          when "p" then paragraph(count)
        end
      else
        raise WrongFormat, "Your dummy text has a wrong format! DummyText just understands 'Xc' for x characters, 'Xw' for x words, 'Xs' for x sentences, 'Xp' for x paragraphs, 'X' stands for the count."
      end
    end

    private
    
    # select "count characters"
    def character(count)
      raw Words.join(" ").chars.to_a[0...count].join
    end
    
    # select "count" words
    def word(count)
      raw Words[0...count].join(" ")
    end
    
    # select "count" sentences, wrap in p-tags
    def sentence(count)
      s = Sentences[0...count].join('. ')
      raw "<p>#{s}.</p>"
    end

    # select "count" paragraphs, wrap in p-tags
    def paragraph(count)
      count_paragraphs = Paragraphs.size
      if count > count_paragraphs
        raise TooMuchError, "Your template just offers #{count_paragraphs} paragraphs. Please extand it."
      end
      
      i = 0
      result = ""
      while i < count
        result += "<p>#{Paragraphs[i]}</p>"
        i += 1
      end
      raw result
    end
  end
end