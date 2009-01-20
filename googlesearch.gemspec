Gem::Specification.new do |s|
  s.name = 'googlesearch'
  s.version = '0.2.0'
  s.date = '2009-01-14'
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = false
  s.summary = 'Google CSE implementation'
  s.description = 'Abstraction of the Google CSE XML API'
  s.authors = ["Rene Heino", "Matthijs Langenberg"]
  s.email = 'rails@newminds.nl'
  s.files = [ "googlesearch.gemspec", 
              "lib/googlesearch.rb",
              "lib/googlesearch/search_response.rb",
              "lib/googlesearch/search_result.rb",
              "lib/googlesearch/search_page.rb"]
  s.test_files = ["spec/google_search_spec.rb",
                  "spec/search_response_spec.rb",
                  "spec/search_result_spec.rb",
                  "spec/search_page_spec.rb",
                  "spec/spec_helper.rb",
                  "spec/result_example.xml"]
  s.add_dependency("nokogiri", [">= 1.1.1"])
end


  
