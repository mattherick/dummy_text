require 'spec_helper'

describe DummyText::Character do
  
  before(:each) do
    @template = Dir.glob(File.dirname(__FILE__) + "/fixtures/short_template.txt").first
  end
  
  it "should render character" do
    count = 2
    DummyText::Character.new.render(count, @template).should == "lo"
  end
    
  it "should get number of characters" do
    DummyText::Character.number_of_characters(@template).should == 12
  end

end