##############################################################################################################
module Zgomot::Comp

  #####-------------------------------------------------------------------------------------------------------
  module Transforms

    #.........................................................................................................
    def repeat(times, opts={})
      (1..times).to_a.inject(Midi::Channel.create(opts[:chan])) do |c,i|
        c + pattern
      end; self
    end

    #.........................................................................................................
    def time_shift(secs)
      pattern.each{|p| p.offset_time=secs}; self
    end

  #### Repeat
  end

#### Zgomot ::Comp
end
