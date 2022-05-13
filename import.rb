#James Hughes 2022-05-13

#Parser for taking raw flight information to JSON for pilot evaluation
require 'date'
require 'json'

#Read raw txt file
#raw is an array of strings
File.open("ual.txt" do |log_file|
  raw = log_file.readlines
end
  

#Parse txt file to array of hashes

#Output array to JSON
File.write('./flights.json', JSON.dump(flights))