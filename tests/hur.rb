#!/usr/bin/env ruby

# Based off of this anwer to my question
# http://stackoverflow.com/a/26749078/1626687

require 'csv'

array_of_arrays = CSV.read('sample-data2.csv')

p array_of_arrays # => [["id", "name", "age"],
                  # =>  ["1", "jack", "26"],
                  # =>  ["2", "jill", "27"]]    

new_keywords = ['dur','hur','whur']

array_of_arrays[0] = new_keywords

p array_of_arrays # => [["dur", "hur", "whur"],
                  # =>  ["1", " jack", " 26"],
                  # =>  ["2", " jill", " 27"]]

# Delete every row that contains 'jack' in the 'name' column
array_of_arrays.delete_if do |row|
  row[:name].to_s.casecmp('jack') != 0
end
puts @simplecsv