require File.join(File.dirname(__FILE__), 'spec_helper')

describe SearchResponse do
  
  setup do 
    @example_xml = File.read(File.join(File.dirname(__FILE__), 'result_example.xml'))
    @response = SearchResponse.new(@example_xml, 5)
  end
  
  it "shoud be able to return total server time in seconds" do
    @response.total_server_time.should == 0.458025
  end
  
  it "should be able to return total number of results" do
    @response.total_number_of_results.should == 23
  end
  
  it "should be able to return the index of the first search result returned in the result set" do
    @response.index_of_first_result.should == 1
  end
  
  it "should be able to return the index of the last search result returned in the result set" do
    @response.index_of_last_result.should == 5
  end
  
  it "should return 5 for the start index" do
    @response = SearchResponse.new(@example_xml, 0, 5)
    @response.start_index.should == 5
  end
  
  it "should return 0 for the start index as default" do
    @response.start_index.should == 0
  end
  
  it "should return 5 for the requested number of search results" do
    @response.requested_number_of_search_results.should == 5
  end
  
  it "should return 10 for the requested number of search result as default" do
    @response = SearchResponse.new(@example_xml)
    @response.requested_number_of_search_results.should == 10
  end
  
  it "should be able to return an array of SearchResult objects" do
     @response.results.map { |r| r.class }.should == [SearchResult]*5
  end
  
  it "should known that there are five pages with results" do
    @response.number_of_pages.should == 5
  end
  
  it "should provide high level pagination" do
    @response.pages[0].page_number.should == 1
    @response.pages[0].start_index.should == 0
  end
  
  it "should be able to return the current page" do
    @response.current_page.should == @response.pages[0]
  end
  
  it "should be able to return the next page" do
    @response.next_page.should == @response.pages[1]
  end
  
  it "should return nil for the previous page" do
    @response.previous_page.should == nil
  end
end
