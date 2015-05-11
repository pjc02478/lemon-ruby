module Flowcontrol
  
  class Signal
    attr_reader :waiting_contexts

    def initialize
      @waiting_contexts = Array.new
    end

    def notify_one
      return false if waiting_contexts.empty?

      return true
    end
    def notify_all
      c = 0
      c+=1 until !notify_one
      return c
    end
  end

  def self.delay timeunit
    
  end
  def self.delay_until signal
  end
end
