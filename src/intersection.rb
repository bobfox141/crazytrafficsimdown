#!/usr/bin/env ruby
# frozen_string_literal: true
require("traffic-light")

class Intersection
  def initialize
    @north = TrafficLight.new
    @south = TrafficLight.new
    @east = TrafficLight.new
    @west = TrafficLight.new
  end



end
