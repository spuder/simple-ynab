#!/usr/bin/env ruby

require 'csv'

# Based on this question
# http://stackoverflow.com/questions/26707169/how-to-remove-a-row-from-a-csv-with-ruby

#Some other good info
#http://www.sitepoint.com/guide-ruby-csv-library-part-2/
@simple_keywords = ["Date", "Description", "Category", "Memo", "Amount"]
@ynab_keywords   = ["Date", "Payee", "Category", "Memo", "Amount"]

@newcsv = []
puts ""


# Get the csv file from args or prompt user
ARGV.each do |argument|
  @csvfile = ARGV[0]
end

if ARGV.empty?
  print "No file detected, enter file name: "
  @csvfile = gets
end

# Import csv
table = CSV.table(@csvfile)
# # Save CSV headers to array
# @headers = CSV.open(@csvfile,'r', :headers => true).read.headers
# # Convert CSV headers array to indexible hash (you know, for search)
# @headersHash = Hash[@headers.map.with_index.to_a] #http://bit.ly/1yOZt3Z

puts "csv is #{table}"
# puts "headers are #{@headers}"

table.delete_if do |row|
  #Evaluate every row, delete if header = foo
    row[:foo] == 'true'
end

puts "=========="
puts table.to_csv
puts "=========="


puts "headers are #{table.headers}"
puts "headers to csv are #{table.headers.to_csv}"
puts "header 1 is #{table.headers.values_at(0)}"

new_headers=["date","derp","bar"]
# table.headers.values_at(0) = 'derp'
puts "header 1 is #{table.headers[1]}"
table.headers[1]= 'derp'
puts "header 1 is #{table.headers[1]}"

puts "inspection is #{table.inspect}"
puts "=========="
puts "renaming the headers"

old_words = ["foo"]
new_words = ["herp"]


indicies = new_words.map{ |column| table.headers.to_csv.index(column) }

puts "indicies are #{indicies}"
puts "indici 1 is #{table.headers.to_csv.index('foo')}"
# derp =  old_words.map{ |column_header| table.headers.index(column_header)}
# puts "derp is #{derp}"
