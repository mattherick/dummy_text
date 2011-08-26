require 'spec_helper'

describe DummyText::Sentence do
  
  before(:each) do
    @template = Dir.glob(File.dirname(__FILE__) + "/fixtures/middle_template.txt").first
  end
  
  it "should render sentence" do
    count = 2
    DummyText::Sentence.new.render(count, @template).should == "lorem ipsum.lorem2 ipsum2."
  end

  it "should get number of sentences" do
    DummyText::Sentence.number_of_sentences(@template).should == 2
  end

end