module DummyText
  class Text
    
    def initialize
    end
    
    def self.get_file
      path = Rails.root.to_s + "/config/dummy_text/text_template.txt"
      file = File.file?(path) ? Dir.glob(path) : Dir.glob(File.dirname(__FILE__) + "/template/text_template.txt")
      file.first
    end
    
    def self.get_file_as_string(file)
      data = ''
      f = File.open(file, "r") 
      f.each_line do |line|
        data += line
      end
      return data
    end
  
    def get_file_as_array(file)
      data = ''
      f = File.open(file, "r")
      f.each_line do |line|
        data += line
      end
      return data.to_a.join.split("\n\n")
    end

  end
end