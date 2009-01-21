class SearchPage
  #index is zero-based
  def initialize(index, index_of_last_result, results_per_page)
    @index = index
    @index_of_last_result = index_of_last_result
    @results_per_page = results_per_page
  end
  
  def page_number
    @index+1
  end
  
  def start_index
    @index*@results_per_page
  end
  
  def current_page?
    (@index_of_last_result/@results_per_page) == page_number
  end
end