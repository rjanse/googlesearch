class SearchResponse
  attr_reader :total_server_time, :total_number_of_results, :results, :index_of_first_result, :index_of_last_result
  def initialize(xml)
    doc = Nokogiri::XML(xml)
    @total_server_time = doc.root.xpath('TM').text.to_f 
    @index_of_first_result = doc.root.xpath('RES/@SN').text.to_i
    @index_of_last_result = doc.root.xpath('RES/@EN').text.to_i
    @total_number_of_results = doc.root.xpath('RES/M').text.to_i
    @results = []
    doc.root.xpath('RES//R').each do |res_doc|
      @results << SearchResult.new(res_doc)
    end
  end
end