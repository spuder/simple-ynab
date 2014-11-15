#!/usr/bin/env ruby

require 'csv'
# From this tutorial http://technicalpickles.com/posts/parsing-csv-with-ruby/

body = 'ford.csv'
csv = CSV.read(body)

puts csv.to_a {|row| row.to_hash}

puts csv.to_a

