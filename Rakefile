require 'rubygems'
require 'nokogiri'
require 'spec'
require 'spec/rake/spectask'

desc "Run the specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/*_spec.rb']
  t.spec_opts = ['-f s', '--color']
end
