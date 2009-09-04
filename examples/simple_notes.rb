require 'rubygems'
require "#{File.dirname(__FILE__)}/../lib/zgomot"

#.........................................................................................................
before_start do
  Zgomot.logger.level = Logger::DEBUG
end

#.........................................................................................................
str 'notes' do
  ch << [n([:C,5]), n(:B), n(:R), n(:G), n(:C,2), n([:E,5],:l=>2)]
end

#.........................................................................................................
play