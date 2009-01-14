require File.join(File.dirname(__FILE__), 'spec_helper')

describe SearchResponse do
  
  setup do 
    example_xml = File.read(File.join(File.dirname(__FILE__), 'result_example.xml'))
    @response = SearchResponse.new(example_xml)
  end
  
  it "shoud be able to return total server time in seconds" do
    @response.total_server_time.should == 0.458025
  end
  
  it "should be able to return total number of results" do
    @response.total_number_of_results.should == 520
  end
  
  it "should be able to return the index of the first search result returned in the result set" do
    @response.index_of_first_result.should == 1
  end
  
  it "should be able to return the index of the last search result returned in the result set" do
    @response.index_of_last_result.should == 5
  end
  
  it "should be able to return an array of SearchResult objects" do
     @response.results.map { |r| r.class }.should == [SearchResult]*5
  end
end