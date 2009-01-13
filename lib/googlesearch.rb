require 'googlesearch/search_response'
require 'googlesearch/search_result'
require 'open-uri'

class GoogleSearch
  
  attr_reader :response
  
  def initialize(options, search_request = SearchRequest.new)
    @response = SearchResponse.new search_request.get("http://www.google.com/search?&q=#{options[:q]}&client=google-csbe&output=xml&cx=#{options[:cx]}&cr=lang_#{options[:cr]}")
  end
end

class SearchRequest
  def get(uri)
    open(uri)
  end
end