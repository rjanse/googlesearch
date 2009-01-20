require File.join(File.dirname(__FILE__), 'spec_helper')

describe SearchPage do
  it "should have page number of 1" do
    p = SearchPage.new(0, 0, 10)
    p.page_number.should == 1
  end
  
  it "should have a start index of 0 when the index is 0" do
    p = SearchPage.new(0, 0, 10)
    p.start_index.should == 0
  end
  
  it "should have a start index of 10 when the index is 1 and the requested number of results is 10" do
    p = SearchPage.new(1, 0, 10)
    p.start_index.should == 10
  end
  
  it "should know that it is the current page if the given page index equals the start index" do
    p = SearchPage.new(1, 10, 10)
    p.should be_current_page
  end
  
  it "should know that it is not the current page if the given page index does not equal the start index" do
    p = SearchPage.new(0, 10, 10)
    p.should_not be_current_page
  end
end