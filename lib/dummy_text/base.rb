require 'dummy_text/text'
require 'dummy_text/character'
require 'dummy_text/word'
require 'dummy_text/sentence'
require 'dummy_text/paragraph'

module DummyText
  module Base

    class WrongFormat < StandardError; end
    class TooMuchError < StandardError; end
    
    def dummy_text(arg)
      template = Text.get_file
      if /(\d+)([c|w|s|p])/i.match(arg)
        count = $1.to_i
        
        case $2.downcase
          when "c" then character(count, template)
          when "w" then word(count, template)
          when "s" then sentence(count, template)
          when "p" then paragraph(count, template)
        end
      else
        raise WrongFormat, "Your dummy text has a wrong format! DummyText just understands 'Xc' for x characters, 'Xw' for x words, 'Xs' for x sentences, 'Xp' for x paragraphs, 'X' stands for the count."
      end
    end

    private
    
      # select "count characters"
      def character(count, template)
        out_of_order("c", count, template)
        raw Character.new.render(count, template)
      end
      
      # select "count" words
      def word(count, template)
        out_of_order("w", count, template)
        raw Word.new.render(count, template)
      end
      
      # select "count" sentences, wrap in p-tags    
      def sentence(count, template)
        out_of_order("s", count, template)
        raw "<p>#{Sentence.new.render(count, template)}</p>"
      end
  
      # select "count" paragraphs, wrap in p-tags
      def paragraph(count, template)
        out_of_order("p", count, template)
        i = 0
        result = ""
        data = Paragraph.new.render(template)
        while i < count
          result += "<p>#{data[i]}</p>"
          i += 1
        end
        raw result
      end
      
      def out_of_order(type, count, template)
        case type
          when "c"
            characters = Character.number_of_characters(template)
            if count > characters
              raise TooMuchError, "The template just offers #{characters} characters. Please extand it."
            end
          when "w"
            words = Word.number_of_words(template)
            if count > words
              raise TooMuchError, "The template just offers #{words} words. Please extand it."
            end
          when "s"
            sentences = Sentence.number_of_sentences(template)
            if count > sentences
              raise TooMuchError, "The template just offers #{sentences} sentences. Please extand it."
            end
          when "p"
            paragraphs = Paragraph.number_of_paragraphs(template)
            if count > paragraphs
              raise TooMuchError, "The template just offers #{paragraphs} paragraphs. Please extand it."
            end
          end
        end
        
  end
end