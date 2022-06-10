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



flight = Hash.new
#Parse txt file to array of hashes
raw.each do |l|
  if l.include?('BASIC')
    i_pos = l.split.index('ID')
    flight[:id] = l.split[i_pos+1]
    #puts '-----'
    #puts flight[:id]
  end
  
  if l.include?('TAFB')
    l.strip!.gsub!(/[*]|[-]/,' ')
    #puts l
    
    i_pos = l.split.index('CRD')
    flight[:crd] = l.split[i_pos+1]
    
    i_pos = l.split.index('TAFB')
    flight[:tafb] = l.split[i_pos+1]  
    
    flights << flight
    flight = Hash.new
  end
end
puts flights.size.to_s + ' records parsed'

#Output array to JSON
File.write('./flights.json', JSON.dump(flights))