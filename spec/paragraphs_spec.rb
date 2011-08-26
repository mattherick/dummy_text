require 'spec_helper'

describe DummyText::Paragraph do
  
  before(:each) do
    @template = Dir.glob(File.dirname(__FILE__) + "/fixtures/text_template.txt").first
  end
  
  it "should render paragraph" do
    count = 1
    DummyText::Paragraph.new.render(@template).should == ["Lorem ipsum dolor sit amet, consectetur adipiscing elit.
velit sagittis ultrices laoreet, neque nulla sagittis dolor, in tristique turpis 
ipsum vitae diam. Integer leo lorem, ornare non tristique quis, pharetra at dolor.", " Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis 
egestas. Maecenas ut lacinia est. Nullam imperdiet vestibulum dolor. Fusce posuere dui 
eget erat suscipit in ultrices leo lobortis. Nunc id massa ante, id fermentum sem."]
  end
    
  it "should get number of paragraphs" do
    DummyText::Paragraph.number_of_paragraphs(@template).should == 2
  end

end