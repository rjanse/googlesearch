class SearchResult
  attr_reader :url, :index, :title, :excerpt, :language
  def initialize(doc)
    @url = doc.xpath('U').text
    @index = doc.attributes["N"].text.to_i
    @title = doc.xpath('T').text
    @excerpt = doc.xpath('S').text
    @language = doc.xpath('LANG').text
  end
end