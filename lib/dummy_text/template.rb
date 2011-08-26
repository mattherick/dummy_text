module DummyText
  module Template
    
    def self.paragraphs
      file = get_file
      set_file(file)
    end
    
    def self.get_file
     # Dir.chdir(Rails.root)
      path = Rails.root.to_s + "/config/dummy_text/text_template.txt"
      file = File.file?(path) ? Dir.glob(path) : Dir.glob(File.dirname(__FILE__) + "/template/text_template.txt")
      file.first
    end
    
    def self.set_file(file)
      data = self.get_file_as_array(file)
    end
    
    def self.get_file_as_array(file)
      data = ''
      f = File.open(file, "r") 
      f.each_line do |line|
        data += line
      end
      return data.to_a.join.split("\n\n")
    end
  end
  
    Paragraphs = DummyText::Template.paragraphs

    Sentences = Paragraphs.join.split('. ')

    Words = Sentences.join.split
end