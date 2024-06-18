#!/usr/bin/env ruby
# file: traffic-light.rb
# author: smg
# description: a basic traffic light simulation using a simple timing loop. 
# this class is called by a main function main.rb 
# it is a 4 position light, north south east west. 
# it uses the US convention sequence red - 60, green - 45, yellow - 15. 
# crossing lights cannot be green at the same time. emergency status 
# turns all lights blinking red. 
# no traffic status turns all lights blinking yellow. 



# so, the traffic light is set up so it can interface directly with a 
# display object, i.e. each invidual light is enabled. 
RED = 0
YELLOW = 1
GREEN = 2
GREENARROWLEFT = 3
GREENARROWRIGHT = 4 
CAUTIONARROWLEFT = 5
CAUTIONARROWRIGHT = 6

BASIC = 0 
SIMPLESIGNAL = 1
FOURWAYSTOP = 2
FOURWAYCAUTION = 3
SIMPLELEFTARROW = 4
SIMPLERIGHTARROW = 5
SIMPLELEFTCAUTION = 6
SIMPLERIGHTCAUTION = 7

class TrafficLight

	def initialize
		@red = true
		@yellow = false
		@green = false
	end
	
	def setRed
		@red = true
		@yellow = false
		@green = false
	end
	
	def setGreen
		@red = false
		@yellow = false
		@green = true
	end
	
	def setYellow
		@red = false
		@yellow = true
		@green = false
	end
	
	def checkLight
		if red == true then 
			if yellow == false && green == false then 
				return true
			else
				return false
			end
		elsif yellow == true then 
			if red == false && green == false then
				return true
			else
				return false
			end
		elsif green == true then 
			if red == false && yellow == false then 
				return true
			else 
				return false
			end
		end
	end
	
	
end
