class SearchPage
  #index is zero-based
  def initialize(index, results_per_page)
    @index = index
    @results_per_page = results_per_page
  end
  
  def page_number
    @index+1
  end
  
  def start_index
    @index*@results_per_page
  end
end