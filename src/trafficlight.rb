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

require "./timer.rb"

RED = 0
YELLOW = 1
GREEN = 2



BASIC = 0


class TrafficLight

	def initialize(type)
		setRed()
		@type = type
		@done = false
	end

	def killlight
		@done = true
	end

	def setRed
		@state = RED
		@red = true
		@yellow = false
		@green = false
	end
	
	def setGreen
		@state = GREEN
		@red = false
		@yellow = false
		@green = true
	end
	
	def setYellow
		@state = YELLOW
		@red = false
		@yellow = true
		@green = false
	end
	
	def checkLight
		if red == true then 
			if yellow == false && green == false then 
				return true
			end
		elsif yellow == true then 
			if red == false && green == false then
				return true
			end
		elsif green == true then 
			if red == false && yellow == false then 
				return true
			end
		end
		return false 
	
	end

	def setTimings
		if @type == BASIC then 
			return {RED => 60, YELLOW => 30, GREEN => 60 }
		end 
	end



	def go
		t = LightTimer.new
		setRed()
		count = 0
		timings = setTimings
		seqbegin = t.now
		seqswitch = seqbegin + timings[RED]
		while not @done
			current = t.now
			if current >= seqswitch then 
				if @state == RED then 
					setGreen
					seqswitch = seqbegin + timings[GREEN]
					puts "Switching the active light to Green"
				end 
				if @state == YELLOW then 
					setRed
					seqswitch = seqbegin + timings[RED]
					puts "Switching the active light to Red, will switch again in #{current + timings[RED]}"
				end
				if @state == GREEN then 
					setYellow
					seqswitch = seqbegin + timings[YELLOW]
					puts "Switching the active light to Yellow, will switch again in #{current + timings[YELLOW]}"
				end
			else
				sleep(0.2)  # running at about 5hz 
				count = count + 1
			end
			if count > 5 then 
				showLight
				count = 0
			end

		end
		puts "Loop ended, controller exiting."
	end
		
	def showLight
		puts "Red:    #{@red}"
		puts "Yellow: #{@yellow}"
		puts "Green:  #{@green}"
	end

		

	
end
