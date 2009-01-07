require File.join(File.dirname(__FILE__), 'spec_helper')

describe GoogleSearch do
  it do
    request_mock = mock('request')
    request_mock.should_receive(:get).with(
      'http://www.google.com/search?&q=adres&client=google-csbe&output=xml&cx=unique-cse-id'
    ).and_return('wat_xml')
    
    SearchResponse.should_receive(:new).with('wat_xml').and_return('search-response-object')
    search = GoogleSearch.new({:cx => 'unique-cse-id', :q => 'adres'}, request_mock)
    search.response.should == 'search-response-object'
  end
end