#!/usr/bin/env ruby
# file: timer.rb
# description: a simple timer in ruby. 
# author: smg

require "time"

class LightTimer
    def initialize
        @t = Time.new
        @current = Time.now 
    end

    def now 
        return Time.now.to_i
    end

end
