module Flowcontrol
  
  class Signal
    attr_reader :waiting_contexts

    def initialize
      @waiting_contexts = Array.new
    end

    def notify_one
      return false if waiting_contexts.empty?

      waiting_contexts.pop.schedule
      return true
    end
    def notify_all
      c = 0
      c+=1 until !notify_one
      return c
    end
  end

  def self.delay timeunit
    t = Dispatcher::Timer.new timeunit
    Dispatcher::add_timer t
    self.delay_until t.sig
  end
  def self.delay_until signal
    current = Microthread::current
    signal.waiting_contexts.push current
    current.yield
  end
end
