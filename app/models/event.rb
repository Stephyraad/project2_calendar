class Event
  include Mongoid::Document
  field :date, type: Date
  field :input, type: String
  field :location, type: String
  field :address1, type: String
  field :city, type: String
  field :state, type: String
  field :zipcode, type: String
  field :event_type, type: String
  belongs_to :user
  #validates_presence_of :date, :input, :year, :price, :transmission
  #validates_length_of :year, minimum: 4, maximum: 4
  #validates_numericality_of :year, :price,greater_than_or_equal_to: 1950, message: "year must be between 1950 and 2015"
  #validates_inclusion_of :event_type, in: ["Night Event", "Day Event"],
  #message: "not correct transmission"



end
