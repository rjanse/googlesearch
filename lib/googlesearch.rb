require 'rubygems'
require 'enumerator'
require 'googlesearch/search_response'
require 'googlesearch/search_result'
require 'googlesearch/search_page'
require 'open-uri'
require 'nokogiri'


class GoogleSearch
  
  attr_reader :response
  
  def initialize(o = {}, search_request = SearchRequest.new)
    @response = SearchResponse.new( search_request.get("http://www.google.com/search?&q=#{o[:q]}&client=google-csbe&output=xml_no_dtd&cx=#{o[:cx]}&cr=lang_#{o[:cr]}&lr=lang_#{o[:lr]}&start=#{o[:start]}&num=#{o[:num]}"), o[:num], o[:start])
  end
end

class SearchRequest
  def get(uri)
    open(uri)
  end
end