# require 'parallel'

thread_count = 4
@number = 5555

# loop do
#   try = rand(0..100000000)
#   # puts try
#   break if try == @number
# end

# @message = ', and it can see this!'
# msg = ' ... but not this.'


# Parallel.each(1..thread_count, in_processes: thread_count) do |p_id|
#   loop do
#     try = rand(0..100_000_000)
#     # puts try
#     break if try == @number
#   end
#   puts p_id.to_s + ' done' + @message + msg
#   @message += ' - ' + p_id.to_s + ' was here'
#   msg += ' - ' + p_id.to_s + ' was here'
# end
# puts @message
# puts msg

threads = []
reader, writer = IO.pipe

# Signal.trap("HUP") { puts "Die!"; threads.each { |pid| Process.kill("HUP", pid) } }

# puts Signal.list
# exit


thread_count.times do |p_id|
  threads << fork do
    # Signal.trap("HUP") { exit }
    reader.close
    loop do
      try = rand(0..100_000_000)
      # puts try
      break if try == @number
    end
    # puts p_id.to_s + ' done' + @message + msg
    writer.puts "The answer has been found by me, i am #{p_id}"
    # Process.kill("HUP", Process.ppid)
    # @message += ' - ' + p_id.to_s + ' was here'
    # msg += ' - ' + p_id.to_s + ' was here'
  end
end
# puts @message
# puts msg
writer.close

# while message = reader.gets
#   puts message
#   threads.each {|pid| Process.kill('HUP', pid)}
# end


puts reader.gets
threads.each {|pid| Process.kill('HUP', pid)}

thread_count.times { Process.wait }
