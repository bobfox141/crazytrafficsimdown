#!/usr/bin/env ruby
# file: timer.rb
# description: a simple timer in ruby. 
# author: smg

require "time"

class LightTimer
    def initialize
        @t = Time.new
        @current = @t.now 
    end
    
    def now 
        return @t.now.to_i
    end

end
