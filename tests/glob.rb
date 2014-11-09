#!/usr/bin/env ruby

require 'csv'

#http://stackoverflow.com/questions/18137849/reading-csv-files-and-rewriting-them-without-certain-rows-python

# # Get the csv file from args or prompt user
# ARGV.each do |argument|
#   @csvfile = ARGV[0]
# end

# if ARGV.empty?
#   print "No file detected, enter file name: "
#   @csvfile = gets
# end

# Import csv
@csv = CSV.read('sample-data2.csv', headers: true) #http://bit.ly/1mSlqfA
@headers = CSV.open('sample-data2.csv','r', :headers => true).read.headers
@headersHash = Hash[@headers.map.with_index.to_a] #http://bit.ly/1yOZt3Z

puts "====="


i = 0
@csv.each do |row|
  # puts row[5]
  if row[@headersHash['foo']] == 'false'
    # @csv_no_pending.add_row(row)
    @csv.delete(i)
  else
    puts "not pushing row #{row}"
  end
  i += i
end

puts "====="
puts @csv

@csv = @csv.delete(2)

puts "====="
puts @csv