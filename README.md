# lemon-ruby

```ruby
handle = Microthread::create do
  puts "begin task"
  Flowcontrol::delayt TimeUnit::second(1.0)
  puts "after 1 second"
end

handle.schedule

while true
  sleep 0.1
  Dispatcher::step
end
```
