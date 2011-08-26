ENV["RAILS_ENV"] ||= 'test'

require 'rubygems'
require 'bundler/setup'

# gem dummy_text files
require  "lib/dummy_text/base"
require  "lib/dummy_text/text"
require  "lib/dummy_text/character"
require  "lib/dummy_text/word"
require  "lib/dummy_text/sentence"
require  "lib/dummy_text/paragraph"
