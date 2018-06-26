# @done = false

# 3.times do
#   Thread.new do
#     sleep rand(10)
#     func1
#   end
# end

# def func1; func2 end
# def func2; func3 end
# def func3; func4 end

# def func4
#   @done = Thread.list.index(Thread.current)
# end

# loop until @done
# puts @done
# puts Thread.list.index(Thread.current)

connections = 4
offset = 3
thread_count = 4

test = ((4**(connections - 2)) * (offset.to_f / thread_count)).to_i

puts (4**(connections - 2))

puts offset

puts thread_count

puts test.to_s(4).rjust(connections, '0')
