require_relative './lib/oystercard.rb'
require './lib/station.rb'
require './lib/journey.rb'

p o = Oystercard.new
p earls = Station.new(:Earls, 1)
p aldgate = Station.new(:Aldgate, 1)
p o.touch_in(:entry_station => earls)
p o.current_journey
p o.in_journey?
p o.journeys
p 5
p o.touch_in(:entry_station => aldgate)
p o.balance
p 6
p o.touch_out(:exit_station => earls)
p o.journeys
p 7
p o.top_up(50)
p 9
p array = []
p array << Journey.new().entry_station = earls
p 10
p array << Journey.new()
p 11
p new_j = Journey.new({ exit_station => earls })
p new_j
p 12
p o.touch_out(:exit_station => aldgate)
p o.journeys
