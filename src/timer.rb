#!/usr/bin/env ruby
# file: timer.rb
# description: a simple timer in ruby. 
# author: smg

require "Time"

class LightTimer

    def now 
        return Time.now.to_i
    end

end
