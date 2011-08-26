require 'spec_helper'

describe DummyText::Word do
  
  before(:each) do
    @template = Dir.glob(File.dirname(__FILE__) + "/fixtures/short_template.txt").first
  end
  
  it "should render word" do
    count = 2
    DummyText::Word.new.render(count, @template).should == "lorem ipsum."
  end
    
  it "should get number of words" do
    DummyText::Word.number_of_words(@template).should == 2
  end

end