module Microthread
  
  class Handle
    
    def initialize fiber
      @fiber = fiber

    end

    def schedule
      @fiber.resume
    end
    def yield
      Fiber.yield
    end

    def id
      Thread.current.object_id
    end
  end
  
  def self.create func =nil, &proc
    return handle = Handle.new(Fiber.new do
      puts "start fiber"
      Thread.current[:_handle] = handle
      (func ||= proc).call
      puts "end fiber"
    end)
  end
  def self.current
    Thread.current[:_handle]
  end
end
