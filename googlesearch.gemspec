Gem::Specification.new do |s|
  s.name = 'googlesearch'
  s.version = '0.0.1'
  s.date = '2009-01-07'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = 'Google CSE implementation'
  s.description = 'Abstraction of the Google CSE XML API'
  s.authors = ["Rene Heino", "Matthijs Langenberg"]
  s.files = [ "googlesearch.gemspec", 
              "lib/googlesearch.rb",
              "lib/googlesearch/search_response.rb",
              "lib/googlesearch/search_result.rb"]
  s.test_files = ["google_search_spec.rb",
                  "search_response_spec.rb",
                  "spec_helper.rb",
                  "result_example.xml"]
  s.add_dependency("nokogiri", ["> 0.0.0"])
end
  