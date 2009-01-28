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

    #o[:as_epq] ||= ""
    # Optional. The as_epq parameter identifies a phrase that all documents in the search results must contain. You can also use the phrase search query term to search for a phrase.
    # Examples: as_epq=abraham+lincoln
    
    
    #o[:as_eq] ||= ""
    # Optional. The as_eq parameter identifies a word or phrase that should not appear in any documents in the search results. You can also use the exclude query term to ensure that a particular word or phrase will not appear in the documents in a set of search results.
    # Examples: This example shows a search for the word "bass", where all pages in the search results do not contain the word "music": q=bass&as_eq=music
    
    
    #o[:as_lq] ||= ""
    # Optional. The as_lq parameter specifies that all search results should contain a link to a particular URL. You can also use the link: query term for this type of query.
    # Examples: This example shows a search for pages that link to www.google.com: as_lq=www.google.com
        
        
    #o[:as_occt] ||= "any"
    # Specifies where the search engine is to look for the query terms on the page: anywhere on the page, in the title, or in the URL. 
    # any:   anywhere on the page
    # title: in the title of the page
    # URL:   in the URL for the page
    
    
    #o[:as_sitesearch] ||= "oprey.shop-r.nl"
    # Limits search results to documents in the specified domain
    # Example: &as_sitesearch=www.mycompany.com 
   
   
    #o[:entqr] ||= 0
    #   This parameter sets the query expansion policy according to the following valid values:
    # 
    # 0 -- None
    # 1 -- Standard
    # 2 -- Local
    # 3 -- Full
    # If this parameter is omitted, the query expansion value specified for the front end is used.
    
    
    
    #o[:entsp] ||= 0
    # This parameter controls the use of advanced relevance scoring according to the following valid values:
    # 
    # 0 -- Standard
    # a -- Advanced scoring
    # 
    # Advanced scoring uses the parameters set under Result Biasing. If the value is omitted, the value specified for the front end is used.
 
 
    #o[:access] ||= "p"
    # Specifies whether to search public content, secure content, or both.
    # Possible values for the access parameter are:
    #   p - search only public content
    #   s - search only secure content
    #   a - search all content, both public and secure
    
    
    #o[:as_dt] ||= "i"
    # Modifies the as_sitesearch parameter as follows: i: Include, e: Exclude
    
    
    #o[:as_oq] ||= ""
    # Optional. The as_oq parameter provides additional search terms to check for in a document, where each document in the search results must contain at least one of the additional search terms. You can also use the Boolean OR query term for this type of query.
    # Examples: This example shows a search for pages that contain the word "vacation" and either the word "London" or "Paris": q=vacation&as_oq=London+Paris
    
    
    #o[:as_q] ||= ""
    # Optional. The as_q parameter provides search terms to check for in a document. This parameter is also commonly used to allow users to specify additional terms to search for within a set of search results.
    
    
    #o[:as_rq] ||= ""
    # Optional. The as_rq parameter specifies that all search results should be pages that are related to the specified URL. The parameter value should be a URL. You can also use the related: query term for this type of query.
    # Examples: This example shows a search for pages that are related to www.google.com: as_rq=www.google.com
    
    
    #o[:c2off] ||= 0
    # Optional. The c2coff parameter enables or disables the Simplified and Traditional Chinese Search feature. 
    
    
    o[:client] ||= "google-csbe"
    # Required!!! The client parameter must be set to google-csbe if you use Google Custom Search Service.
    
    
    o[:cr] = "lang_#{o[:cr]}" if o[:cr]
    # Optional. The cr parameter restricts search results to documents originating in a particular country.
    
    
    o[:cx] ||= ""
    # Required!!! The cx parameter specifies a unique code that identifies a custom search engine. You must specify a Custom Search Engine using the cx parameter to retrieve search results from that CSE.
    
    
    #o[:filter] ||= 1
    # Optional. The filter parameter activates or deactivates the automatic filtering of Google search results. See the Automatic Filtering section of this document for more information about Google's search results filters.
    
    
    #o[:gl] ||= "nl"
    # Optional. The gl parameter value is a two-letter country code (uk or nl). For WebSearch results, the gl parameter boosts search results whose country of origin matches the parameter value 
    
    
    #o[:hl] ||= "nl"
    # Optional. The hl parameter specifies the interface language (host language) of your user interface. To improve the performance and the quality of your search results, you are strongly encouraged to set this parameter explicitly.


    #o[:ie] ||= "utf8"
    # Optional. The ie parameter sets the character encoding scheme that should be used to interpret the query string. The default ie value is latin1.
    
    o[:lr] = "lang_#{o[:lr]}" if o[:lr]
    # Optional. The lr (language restrict) parameter restricts search results to documents written in a particular language.
    
    
    o[:num] ||= 10
    # Optional. The num parameter identifies the number of search results to return. The default num value is 10, and the maximum value is 20. If you request more than 20 results, only 20 results will be returned.
    
    
    #o[:numgm] ||= 3
    # Number of KeyMatch results to return with the results. A value between 0 to 5 can be specified for this option.    
    
    
    #o[:oe] ||= "utf8"
    # Optional. The oe parameter sets the character encoding scheme that should be used to decode the XML result. The default oe value is latin1.
    
    o[:output] ||= "xml_no_dtd"
    # Required. The output parameter specifies the format of the XML results. The only valid values for this parameter are xml and xml_no_dtd. The chart below explains how these parameter values differ.
    
    
    o[:q] ||= ""
    # Optional. The q parameter specifies the search query entered by the user. Even though this parameter is optional, you must specify a value for at least one of the query parameters (as_epq, as_lq, as_oq, as_q, as_rq) to get search results.
    
    
    #o[:safe] ||= "off"
    # Optional. The safe parameter indicates how search results should be filtered for adult and pornographic content. The default value for the safe parameter is off. Valid parameter values are: off, medium or high
    
    
    o[:start] ||= 10
    # Optional. The start parameter indicates the first matching result that should be included in the search results. The start parameter uses a zero-based index, meaning the first result is 0, the second result is 1 and so forth.
    
    
    #o[:ud] ||= 0
    #Optional. The ud parameter indicates whether the XML response should include the IDN-encoded URL for the search result. IDN (International Domain Name) encoding allows domains to be displayed using local languages: http://www.花井鮨.com. Valid values for this parameter are 1, meaning the XML result should include IDN-encoded URLs, and 0, meaning the XML result should not include IDN-encoded URLs. The default value for this parameter is 0. If the ud parameter is set to 1, the IDN-encoded URL will appear in the UD tag in your XML results. If the ud parameter is set to 0, the URL in the example above would be displayed as: http://www.xn--elq438j.com.


    #o[:getfields] ||= ""
    # Indicates that the names and values of the specified meta tags should be returned with each search result, when available. See Meta Tags for more information.
    
    
    #o[:sort] ||= ""
    # Specifies a sorting method. Results can be sorted by date
    # http://code.google.com/intl/nl/apis/searchappliance/documentation/52/xml_reference.html#request_sort
    
    
    # And finally:
    @response = SearchResponse.new(
      search_request.get("http://www.google.com/search?" + o.map {|key, value| "#{key}=#{value}"}.join('&')), o[:num], o[:start]
    )
    
  end
end

class SearchRequest
  def get(uri)
    open(uri)
  end
end
