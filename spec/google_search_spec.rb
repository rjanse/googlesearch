require File.join(File.dirname(__FILE__), 'spec_helper')

describe GoogleSearch do
  it "should be able to create a search query" do
    request_mock = mock('request')
    request_mock.should_receive(:get).with('http://www.google.com/search?cx=unique-cse-id&q=adres&cr=countryNL&start=10&num=10&lr=lang_nl&output=xml_no_dtd').and_return('wat_xml')
    
    SearchResponse.should_receive(:new).with('wat_xml').and_return('search-response-object')
    search = GoogleSearch.new({:cx => 'unique-cse-id', :q => 'adres', :cr => 'nl', :lr => 'nl'}, request_mock)
    search.response.should == 'search-response-object'
  end
end