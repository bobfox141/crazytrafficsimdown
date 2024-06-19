#!/usr/bin/env ruby
# author: smg
# description
# the launcher for the traffic light program. 
# it sets the initial path and kicks off the timer.

require "traffic-light.rb"

puts "Beginning Traffic light simulation"
light = TrafficLight.new
light.go
