require 'rubygems'
require "#{File.dirname(__FILE__)}/../lib/zgomot"

#.........................................................................................................
before_start do
  Zgomot.logger.level = Logger::DEBUG
end

#.........................................................................................................
str 'scale', [k([:A,4],nil,4), k([:A,4],nil,4).reverse!.shift, n([:R,4])], :lim=>6 do |time, pattern|
  ch << pattern
end

#.........................................................................................................
play