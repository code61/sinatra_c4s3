require 'mongoid'
require 'bson'
require 'csv'

class Athlete
  include Mongoid::Document

  field :name,    type: String
  field :country, type: String
  field :age,     type: Integer
  field :height,  type: Integer
  field :weight,  type: Integer
  field :sex,     type: String
  field :dob,     type: Time
  field :gold,    type: Integer
  field :silver,  type: Integer
  field :bronze,  type: Integer
  field :sport,   type: Integer
  field :event,   type: Array


  def self.load_all(file = 'athletes_london2012.csv')
    CSV.read(file, headers: true).each do |row|
      Athlete.create({
          name:       row["Name"],
          country:    row["Country"],
          age:        row["Age"],
          height:     row["Height"],
          weight:     row["Weight"],
          sex:        row["Sex"],
          dob:        row["Date of birth"],
          gold:       row["Gold"],
          silver:     row["Silver"],
          bronze:     row["Bronze"],
          sport:      row["Sport"],
          event:      row["Event"].split(", ")
        })
    end
  end
end
