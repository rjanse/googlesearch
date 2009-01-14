class SearchResult
  attr_reader :url, :index, :title, :excerpt, :language, :mime_type
  def initialize(doc)
    @index = doc.attributes["N"].text.to_i
    
    @mime_type = doc.attributes["MIME"] ? doc.attributes["MIME"].text : nil
    
    @url = doc.xpath('U').text
    @title = doc.xpath('T').text
    @excerpt = doc.xpath('S').text
    @language = doc.xpath('LANG').text
  end
end