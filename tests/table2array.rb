#!/usr/bin/env ruby

require 'csv'


# Import csv
@simplecsv = CSV.table('sample-data2.csv') #http://bit.ly/1mSlqfA
puts ""
# puts "headers are #{@simplecsv.headers}"

puts "--------"

puts "csv is  #{@simplecsv}"

puts "--------"

ynab_headers = ['derpy','herpy','slurpy']
ynab_array = ynab_headers*","
puts "ynab is #{ynab_array}"

# Create a new CSV object with the new headers
@ynabcsv = CSV.parse(ynab_array, :headers => true) do |row|
  puts row
end
puts "ynabcsv is #{@ynabcsv.to_a}"
# puts "ynabcsv headers are #{@ynabcsv.headers}"
@ynabcsv << ['foo','bar','foobar']
@ynabcsv.add_row(['foo','bar','foobar'])

# Convert CSV::Table to array of arrays by reading line by line
# Can only modify the headers by converting to arrays first
@simplecsv.each do | herp | 
  puts "herping is #{herp}"
end