#!/usr/bin/env ruby

require 'csv'


# # Get the csv file from args or prompt user
# ARGV.each do |argument|
#   @csvfile = ARGV[0]
# end

# if ARGV.empty?
#   print "No file detected, enter file name: "
#   @csvfile = gets
# end

# Import csv
@csv = CSV.table('sample-data2.csv') #http://bit.ly/1mSlqfA
# @headers = CSV.open('sample-data2.csv','r', :headers => true).read.headers
# @headersHash = Hash[@headers.map.with_index.to_a] #http://bit.ly/1yOZt3Z

puts "@csv is #{@csv}"

@csv.delete_if do |row|
  row[:foo] == 'TRUE'
end

puts "Now that we've modified the CSV "
puts @csv

# Refer to the table vertically
@csv.by_col!
# Delete the foo column
puts @csv.delete(:foo)

#Delete columns
@derp = ["woo","bar","foo"]
@csv.headers.each do |c|
  puts "c is #{c}, @derp[0] is #{@derp[0]}"
  if @derp.include?(c.to_s) 
   puts "c is in array at location #{@derp.index(c.to_s)}"
  else
    puts "c: #{c}, is not in array"
  end
end


# Rename headers
puts "headers are #{@csv.headers}"
@csv.headers[:date] = 'derp'.to_sym
puts "headers are #{@csv.headers}"
