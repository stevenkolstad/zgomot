##############################################################################################################
module Zgomot::Midi

  #####-------------------------------------------------------------------------------------------------------
  class Channel

    #.........................................................................................................
    include Zgomot::Comp::Transforms
    
    #.........................................................................................................
    @channels = []
    
    #####-------------------------------------------------------------------------------------------------------
    class << self
      
      #.........................................................................................................
      attr_reader :channels

      #.........................................................................................................
      def ch(num=1, opts={})
        (channels << new(is_valid(num), opts)).last
      end

      #.........................................................................................................
      def is_valid(num)
        nums = [num].flatten
        valid = nums.select{|n| 1 <= n and n <= 16 }
        valid.length.eql?(nums.length) ? num : raise(Zgomot::ZgomotError, "channel number invalid: 1<= channel <= 16")
      end

      #.........................................................................................................
      def release(chan)
        channels.delete_if{|c| c.eql?(chan)}
      end

    #### self
    end
    
    #####-------------------------------------------------------------------------------------------------------
    attr_reader :number, :clock, :notes
    attr_accessor :time_offset
    
    #.........................................................................................................
    def initialize(num, opts={})
      @time_offset = opts[:time_offset] || 0.0
      @number = number
      @clock = Clock.new
      @notes = []
    end

    #.........................................................................................................
    def notes
      @notes.flatten.compact 
    end
    
    #.........................................................................................................
    def <<(item)
      add_at_time(item); self
    end

    #.........................................................................................................
    def +(items)
      raise ArgumentError "must be Array" unless items.kind_of?(Array)
      items.each {|n| add_at_time(n)}; self
    end

    #.........................................................................................................
    def method_missing(method, *args, &blk )
      return @notes.send(method, *args, &blk)
    end

  private
  
    #.........................................................................................................
    def add_at_time(item)
      items = [item].flatten
      items.flatten.each do |n|
        raise ArgumentError "must be Zgomot::Midi::Note" unless n.kind_of?(Zgomot::Midi::Note)  
        unless n.pitch_class.eql?(:R)    
          n.time = clock.current_time
          @notes << n
        end
      end  
      clock.update(items.first.length_to_sec)
    end
  
  #### Channel
  end

#### Zgomot::Midi 
end
