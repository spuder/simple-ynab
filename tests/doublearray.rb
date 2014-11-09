#!/usr/bin/env ruby

require 'csv'

@simple_keywords = ["date", "description", "category", "memo", "amount"] # Make sure these are downcased
@ynab_keywords   = ["Date", "Amount", "Payee", "Category", "Memo" ]

# Get the csv file from args or prompt user
ARGV.each do |argument|
  @csvfile = ARGV[0]
end

if ARGV.empty?
  print "No file detected, enter file name: "
  @csvfile = gets
end

# Import csv
@simplecsv = CSV.table(@csvfile) #http://bit.ly/1mSlqfA
puts "headers are #{@simplecsv.headers}"

# Get the 'simple' header indicies
indicies = @simple_keywords.map{ |column| @simplecsv.headers.index(column.downcase.to_sym) }
puts "indicies are #{indicies}"
puts "@simplecsv is #{@simplecsv}"


# Delete the rows with 'pending' transactions
@simplecsv.delete_if do |row|
  #TODO: Add debugging statment showing row being deleted
  row[:pending].to_s.casecmp('false') != 0
end
puts @simplecsv

# Delete the non ynab columns
@simplecsv.headers.each do |c|
  # If column is not in list of simple keywords, delete it
  unless @simple_keywords.include?(c.to_s)
    puts "Deleting column #{c} "
    @simplecsv.delete(c)
  end
end
puts @simplecsv


# ======================
# CSV.foreach(@simplecsv, :headers => true, :converters => :all, :header_converters => lambda {h\})

# @simplecsv.shift
# @simplecsv.unshift(@ynab_keywords)
# puts "simplecsv is #{@simplecsv}"

# Create a csv file on disk, add ynab headers
File.open('ynab.csv','w') do |f|
  f.write(@simplecsv.to_csv)
end

# puts "index is #{@ynab_keywords.index('Date')}"
# # Convert headers
# #http://stackoverflow.com/a/21905450/1626687
# CSV.foreach('ynab.csv',
#       :headers => true,
#       :converters => :all,
#       :header_converters => [@simple_keywords,@ynab_keywords]
#            ) do |row|
#     p row
# end

# Rename the column headers from 'simple' to 'ynab'
lines = File.readlines('ynab.csv')
lines.shift
lines.unshift(@ynab_keywords.join(',') + "\n")
puts lines.join('')
