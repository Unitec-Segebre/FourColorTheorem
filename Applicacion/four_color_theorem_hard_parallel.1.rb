require 'set'
load 'weird_hard.rb'

@semaphore = Mutex.new
@colors = []

def four_color_theorem(graph, thread_count)
  # get_aware graph # Stops working when multithread
  set_threads_colors graph[:connections].keys.size, thread_count
  thread_count.times { Thread.new { partial_solve graph } }
  puts
end

def partial_solve(graph)
  loop do
    # puts @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
    break if solved? graph
    change_colors graph
  end
  @semaphore.synchronize { graph[:colors] = read_color(graph) }
end

# sets starting color configuration per thread
def set_threads_colors(elements, thread_count)
  range = 4**(elements - 1)
  (0...thread_count).each do |i|
    @colors[i] = i * range
  end
end

def get_aware(graph)
  Thread.new do
    puts "Calculating...\nPlease press 'ctrl+D' to view status"
    loop do
      # gets.chomp
      # $stdin.read
      print graph[:colors].to_s(4).rjust(graph[:connections].size, '0') + "\r"
      $stdout.flush
      # sleep 1
    end
  end
end

def read_color(graph)
  # graph[:colors].to_s(4).rjust(graph[:connections].size, '0')
  @colors[Thread.list.index(Thread.current) - 1].to_s(4).rjust(graph[:connections].size, '0')
end

def get_color(graph, position)
  # graph[:colors].to_s(4).rjust(graph[:connections].size, '0')[position]
  @colors[Thread.list.index(Thread.current) - 1].to_s(4).rjust(graph[:connections].size, '0')[position]
end

def set_color(graph, position, color)
  raise 'Color out of bound exception' unless %w[0 1 2 3].include? color
  # graph[:colors].to_s(4).rjust(graph[:connections].size, '0')[position] = color
  @colors[Thread.list.index(Thread.current) - 1].to_s(4).rjust(graph[:connections].size, '0')[position] = color
end

def change_colors(graph)
  # graph[:colors] += 1
  @colors[Thread.list.index(Thread.current) - 1] += 1
end

def solved?(graph)
  visited = Set[]
  graph[:connections].each_key do |node|
    next if visited.include? node
    return false unless valid? graph, node, visited
  end
  true
end

def valid?(graph, node, visited)
  graph[:connections][node].each do |connection|
    next if visited.include? connection
    return false unless safe? graph, node, connection
  end
  visited.add(node)
  true
end

def safe?(graph, node, connection)
  get_color(graph, node.to_i) != get_color(graph, connection.to_i)
end

def print_this(graph)
  graph[:connections].each_key do |node|
    puts node + ': ' + get_color(graph, node.to_i)
  end
end

four_color_theorem(@graph, 2)
# puts 'Colors: ' + @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
loop until @graph[:colors]
print_this @graph
