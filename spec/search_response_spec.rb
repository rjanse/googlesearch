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
    @response.total_number_of_results.should == 5
  end
  
  it "should be able to return the first URL of the results" do
    @response.results.first.url.should == 'http://i3.shop-r.nl/language/nl/pages/39'
  end
  
  it "should be able to return the second index of the results" do
    @response.results[1].index.should == 2
  end
  
  it "should be able to return the last title of the results" do
    @response.results.last.title.should == 'caesar - more'
  end
  
  it "should be able to return the third text of the results" do
    @response.results[2].excerpt.should == %[De &#39;NV <b>Intercodam</b>&#39; is opgericht op 16 september 1919 en handelde in de meest <br>  uiteenlopende producten. In 1972 werd deze NV omgezet in een Beheer B.V. <b>...</b>]
  end
end