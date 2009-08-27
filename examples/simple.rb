require 'rubygems'
require "#{File.dirname(__FILE__)}/../lib/zgomot"

#.........................................................................................................
before_start do
  Zgomot.logger.level = Logger::DEBUG
end

#.........................................................................................................
str 'notes', [n([:C,5]), n([:B,4]), n([:R,4]), n([:G,4]), n([:C,4],2), n([:E,5],2)] do |time, pattern|
  ch << pattern
end

#.........................................................................................................
play