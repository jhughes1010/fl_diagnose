#James Hughes 2022-05-13

#Parser for taking raw flight information to JSON for pilot evaluation
require 'date'
require 'json'


#raw is an array of strings
raw = Array.new
flights = Array.new

#Read raw txt file
File.open("ual.txt") do |log_file|
  raw = log_file.readlines
end

#Parse txt file to array of hashes
raw.each do |l|
  if l.include?('TAFB')
    flight = Hash.new
    i_pos = l.split.index('TAFB-')
    flight[:tafb] = l.split[i_pos+1]
    flights << flight
    #puts '-----'
    #puts flight[:tafb]
    #puts flight
  end
end


  



#Output array to JSON
File.write('./flights.json', JSON.dump(flights))