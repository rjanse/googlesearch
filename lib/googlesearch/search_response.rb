class SearchResponse
  attr_reader :total_server_time, :total_number_of_results, 
              :results, :index_of_first_result, :index_of_last_result, 
              :requested_number_of_search_results, :start_index
  def initialize(xml, requested_number_of_search_results=nil, start_index=nil)
    doc = Nokogiri::XML(xml)
    @total_server_time = doc.root.xpath('TM').text.to_f 
    @index_of_first_result = doc.root.xpath('RES/@SN').text.to_i
    @index_of_last_result = doc.root.xpath('RES/@EN').text.to_i
    @total_number_of_results = doc.root.xpath('RES/M').text.to_i
    @results = doc.root.xpath('RES//R').map { |res_doc| SearchResult.new(res_doc) }
    @requested_number_of_search_results = requested_number_of_search_results ||= 10
    @start_index = start_index ||= 0
  end
  
  def number_of_pages
    (total_number_of_results/requested_number_of_search_results.to_f).round
  end
  
  def pages
    @pages ||= number_of_pages.enum_for(:times).collect { |page_index| SearchPage.new(page_index, index_of_last_result, requested_number_of_search_results) }
  end
  
  def current_page
    pages.find { |p| p.current_page? }
  end
  
  def previous_page
    start_index == 0 ? nil : pages[pages.index(current_page)-1]
  end
  
  def next_page
    pages[pages.index(current_page)+1]
  end
end