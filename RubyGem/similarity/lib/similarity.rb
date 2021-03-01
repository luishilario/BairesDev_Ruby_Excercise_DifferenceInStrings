require "similarity/version"
require "similarity/levenshtein"

module Similarity
  class Error < StandardError; end
  # Your code goes here...
  class String 
    include Levenshtein #Monkey Patch
  end
end
