module Dispatcher
  @running = Array.new
  @pending = Array.new
  
  class Timer
    attr_reader :sig
    attr_accessor :remain, :last

    def initialize s
      @sig = Flowcontrol::Signal.new
      @remain = s
      @last = Time.now.to_f
    end
  end

  def self.add_timer t
    @pending.push t
    return t
  end

  def self.step
    puts "step"
    @running.each do |t|
       t.remain -= Time.now.to_f - t.last
       t.last = Time.now.to_f
        
       if t.remain <= 0
          @running.delete(t).sig.notify_one
       end
    end
    
    @running += @pending.pop(@pending.size)
  end
end
