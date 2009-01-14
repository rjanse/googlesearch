require File.join(File.dirname(__FILE__), 'spec_helper')

describe SearchResult do
  
  setup do 
    example_xml = File.read(File.join(File.dirname(__FILE__), 'result_example.xml'))
    response = SearchResponse.new(example_xml)
    @results = response.results
  end
    
  it "should be able to return the first URL of the results" do
    @results[0].url.should == 'http://i3.shop-r.nl/language/nl/pages/39'
  end
  
  it "should be able to return the second index of the results" do
    @results[1].index.should == 2
  end
  
  it "should be able to return the last title of the results" do
    @results[4].title.should == 'caesar - more'
  end
  
  it "should be able to return the third text of the results" do
    @results[2].excerpt.should == %[De &#39;NV <b>Intercodam</b>&#39; is opgericht op 16 september 1919 en handelde in de meest <br>  uiteenlopende producten. In 1972 werd deze NV omgezet in een Beheer B.V. <b>...</b>]
  end
end