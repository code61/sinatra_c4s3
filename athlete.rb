require 'mongoid'
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
  field :sport,   type: String
  field :events,  type: Array

  def total_medals
    gold + silver + bronze
  end
end
