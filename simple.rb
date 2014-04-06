require 'csv'


$simple_keywords = ["Date", "Description", "Category", "Memo", "Amount"]
$ynab_keywords        = ["Date", "Payee", "Category", "Memo", "Amount"]

$newcsv = []
puts ""

# @csvfile = "foo.csv"
# Get the csv file from args or prompt user
# ARGV.each do |argument|
# 	@csvfile = ARGV[0]
# end

# if ARGV.empty?
# 	print "No file detected, enter file name: "
# 	@csvfile = gets
# end

Shoes.app(title: "Simple-Ynab",width: 600, height: 400, resizable: true) { 
  stack(width: 0.995, height: 0.5) {
    border black, strokewidth: 2

    para("Choose the location of the .csv file from simple")
    @find_button = button "Find .csv"
    # @find_button.style(stroke: red, width: 90)
    @find_button.click {

      $csvfile = ask_open_file
      debug("csvfile is #{$csvfile}")
    }# find_button.click
  } #stack width

  if !$csvfile.nil? || !$csvfile.empty?
    stack(width: 0.995, height: 0.5) {
    border black, strokewidth: 2
      @convert_button = button "Convert"
  
  
      @convert_button.click {
        @p = progress width: 1.0
          @animate = animate(48) do |frame|
            @p.fraction = (frame % 100) / 100.0
            if frame > 99 
              @p.fraction = 1.0
              @animate.stop
              @convert_button.hide()
              @output_message.show()
              
            end
          end
        
      
        # Import csv
        csv = CSV.read($csvfile, headers: true) #http://bit.ly/1mSlqfA
        # @headers = CSV.open('foo.csv','r', :headers => true).read.headers
       
        # puts "csv is #{csv}"
        indicies = $simple_keywords.map{ |column| csv.headers.index(column)}
  
        $newcsv = csv.map { |row| row.values_at(*indicies) }
  
        @filename  = File.basename($csvfile,".*")
        @pathname = File.join( File.dirname($csvfile), "#{@filename}.simple.csv" )
  
        # Save headers to file
        debug("Saving to" +  @pathname)
        CSV.open(@pathname, 'w') do |the_csv|
        	the_csv << $ynab_keywords
        end
        # Save map to file
        CSV.open(@pathname, 'a') do |the_csv|
        	$newcsv.each do |row|
        		the_csv << row
          end
        end
      } #end convert_button.click
      @output_message = para("The file was saved to: #{@pathname}")
      # @output_message.hide()
      @view_button = button "View File"
      @view_button.hide()
    } #stack
  else
  debug("No csv file selected, User most likely canceled file selection")
  end





}








