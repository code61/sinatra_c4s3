require './athlete'

# Mongoid will usually pick up which section of mongoid.yml to use
# from the sinatra environment. As we're going to be working in
# irb without sinatra we need to specify which section to use (:development)
# explicitly.
Mongoid.load!('mongoid.yml', :development)

# Method to load in data from file
def load_athletes(file = 'athletes_london2012.csv')
  puts "Clearing out old athletes .."
  Athlete.destroy_all
  puts "Importing athletes .."
  CSV.read(file, headers: true).each do |row|
    Athlete.create({
        name:       row["Name"],
        country:    row["Country"],
        age:        row["Age"],
        height:     row["Height, cm"],
        weight:     row["Weight"],
        sex:        row["Sex"],
        dob:        extract_date(row["Date of birth"]),
        gold:       row["Gold"],
        silver:     row["Silver"],
        bronze:     row["Bronze"],
        sport:      row["Sport"],
        events:     row["Event"].split(", ")
      })
  end
  puts "Done! You have #{Athlete.count} athletes in your database."
end

def extract_date(date_string)
  Time.strptime(date_string, '%m/%d/%Y')
rescue ArgumentError
  nil
end