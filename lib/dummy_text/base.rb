module DummyText
  module Base

    class WrongFormat < StandardError; end
    class TooMuchError < StandardError; end
    
    def dummy_text(arg)
      if /(\d+)([c|w|s|p])/i.match(arg)
        count = $1.to_i
        
        case $2.downcase
          when "w" then word(num)
          when "c" then character(num)
          when "s" then sentence(num)
          when "p" then paragraph(num)
        end
      else
        raise WrongFormat, "Your dummy text has a wrong format! DummyText just understands 'Xc' for x characters, 'Xw' for x words, 'Xs' for x sentences, 'Xp' for x paragraphs, 'X' stands for the count."
      end
    end

    private
    
    def character(count)
      raw Words.join(" ").chars.to_a[0...count].join
    end
    
    def word(count)
      raw Words[0...count].join(" ")
    end
    
    def sentence(count)
      s = Sentences[0...count].join('. ')
      raw "<p>#{s}.</p>"
    end

    def paragraph(count)
      count_paragraphs = Paragraphs.size
      if count > count_paragraphs
        raise TooMuchError, "Your template just offers #{count_paragraphs} paragraphs. Please extand it."
      end
      
      p = Paragraphs[0...count].join("</p></p>")
      raw "<p>#{p}</p>"
    end
  end
end