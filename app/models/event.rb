class Event
  include Mongoid::Document
  field :date, type: Time
  field :input, type: String
  field :location, type: String
  field :event_type, type: String


end
