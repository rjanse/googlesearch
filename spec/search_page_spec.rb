require File.join(File.dirname(__FILE__), 'spec_helper')

describe SearchPage do
  it "should have page number of 1" do
    p = SearchPage.new(0, 10)
    p.page_number.should == 1
  end
  
  it "should have a start index of 0 when the index is 0" do
    p = SearchPage.new(0, 10)
    p.start_index.should == 0
  end
  
  it "should have a start index of 10 when the index is 1 and the requested number of results is 10" do
    p = SearchPage.new(1, 10)
    p.start_index.should == 10
  end
end