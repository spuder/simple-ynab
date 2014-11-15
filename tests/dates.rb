#!/usr/bin/env ruby

require 'Date'
# Test for converting the date fromat from YYYY-MM-DD to DD-MM-YYYY for ynab simplicity

foo = ["2014/11/12", "2014-11-12 03:06:38 PM -0700", nil, "-6.44", "Signature purchase", "true", "WENDYS #4850", "Wendys", "Food & Drink", "Fast Food", nil, nil, nil, nil, nil, nil, nil]

days_ago = Date.today() - 10

foo_day = Date.parse(foo[0])

puts "dates are #{days_ago} #{foo_day}"
puts "number of days = #{foo_day - days_ago}}"

if days_ago >= foo_day
  puts "days_ago #{days_ago} is after foo_day #{foo_day}"
else
  puts "days_ago #{days_ago} is before foo_day #{foo_day}"

end

puts ""
puts "foo[0] is #{foo[0]}"

foodate = Date.parse(foo[0])
# puts "#{Date.parse foo[0]}"

puts foodate.strftime(format='%d''/''%m''/''%Y')

puts "changing the format"

puts "#{foo[0] = Date.parse(foo[0]).strftime(format='%D').to_s}"
puts "foo[0] is now #{foo[0]}"

