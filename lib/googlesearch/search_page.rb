class SearchPage
  #index is zero-based
  def initialize(index, response_start_index, results_per_page)
    @index = index
    @response_start_index = response_start_index
    @results_per_page = results_per_page
  end
  
  def page_number
    @index+1
  end
  
  def start_index
    @index*@results_per_page
  end
  
  def current_page?
    start_index == @response_start_index
  end
end