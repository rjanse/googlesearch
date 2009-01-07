require 'nokogiri'

class SearchResponse
  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @tm = doc.root.xpath('TM').text.to_f 
    @m = doc.root.xpath('RES/M').text.to_i
    @results = []
    doc.root.xpath('RES//R').each do |res_doc|
      @results << SearchResult.new(res_doc)
    end
  end
  
  def total_server_time
    @tm
  end
  
  def total_number_of_results
    @m
  end
  
  def results
    @results
  end
end