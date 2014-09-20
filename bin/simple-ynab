#!/usr/bin/env ruby

require 'csv'


@simple_keywords = ["Date", "Description", "Category", "Memo", "Amount"]
@ynab_keywords        = ["Date", "Payee", "Category", "Memo", "Amount"]

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
csv = CSV.read(@csvfile, headers: true) #http://bit.ly/1mSlqfA
# @headers = CSV.open('foo.csv','r', :headers => true).read.headers

# Rename the Simple csv headers to match the ynab csv headers
indicies = @simple_keywords.map{ |column| csv.headers.index(column)}

# Create a new csv file with the columns in the ynab order
@newcsv = csv.map { |row| row.values_at(*indicies) }


filename  = File.basename(@csvfile,".*")
pathname = File.join( File.dirname(@csvfile), "#{filename}.simple.csv" )


# Save headers to file
puts "Saving new file to #{pathname}"
CSV.open(pathname, 'w') do |the_csv|
	the_csv << @ynab_keywords
end

# Append the new csv to the file
CSV.open(pathname, 'a+') do |the_csv|
	@newcsv.each do |row|
		the_csv << row
	end
end
