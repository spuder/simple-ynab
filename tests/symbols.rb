#!/usr/bin/env ruby

require 'csv'


# foo = CSV.read('sample-data2.csv', headers: true)

# puts foo

foo = CSV.table('sample-data2.csv')
puts foo.headers
puts "headers are #{foo.headers}"
puts "========="
puts foo.headers.to_a
puts "========="
puts foo.headers.index(:foo)

# indicies = @simple_keywords.each{ |column| @simplecsv.headers.index(column.to_s) }

headers_array = ['foo','bar']
headers_symbol = foo.headers



puts "headers_symbol is #{headers_symbol}"
puts "header symbol foo index is #{headers_symbol.index(:foo)}"

indicies = headers_array.map{|h| headers_symbol.index(h.to_sym)}

# puts "h1 is #{foo.headers[1]}"
# hash = Hash[foo.headers.map.with_index.to_a]
# puts hash['foo']
# # puts "h search is #{foo.headers[':foo']}"

# indicies = headers_array.map{ |h| foo.headers[h]}
puts "indicies are #{indicies}"