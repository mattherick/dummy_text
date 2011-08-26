require 'spec_helper'
require 'rails'

describe DummyText::Text do
  
  it "should get the file position of the template" do
    DummyText::Text.get_file.should == "./lib/dummy_text/template/text_template.txt"
  end
  
  it "should get the file as a string" do
    file = Dir.glob(File.dirname(__FILE__) + "/fixtures/short_template.txt").first
    DummyText::Text.get_file_as_string(file).should == "lorem ipsum."
  end
  
  it "should get the file as an array" do
    file = Dir.glob(File.dirname(__FILE__) + "/fixtures/middle_template.txt").first
    text = DummyText::Text.new
    text.get_file_as_array(file).should == ["lorem ipsum.", "lorem2 ipsum2." ]
  end

end