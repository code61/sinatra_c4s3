require './athlete'

# Mongoid will usually pick up which section of mongoid.yml to use
# from the sinatra environment. As we're going to be working in
# irb without sinatra we need to specify which section to use (:development)
# explicitly.
Mongoid.load!('mongoid.yml', :development)

def reset_data
  puts "Clearing out old athletes .."
  Athlete.destroy_all
  puts "Importing new athletes .."
  Athlete.load_all
  puts "Done! You have #{Athlete.count} athletes in your database."
end