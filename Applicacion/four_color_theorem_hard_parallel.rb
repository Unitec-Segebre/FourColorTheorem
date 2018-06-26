require 'set'
load 'weird_hard.rb'


def four_color_theorem(graph)
  # get_aware graph
  threads = []
  reader, writer = IO.pipe
  thread_count = params[:thread_count]
  thread_count.to_i.times do |offset|
    threads << fork do
      reader.close
      offset_colors(graph, thread_count, offset)
      loop do
        # puts @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
        break if solved? graph
        change_colors graph
        # raise 'No hay mas colores' if graph[:colors] == 4**graph[:connections].size
      end
      writer.puts graph[:colors]
    end
  end
  writer.close
  graph[:colors] = reader.gets.to_i
  threads.each { |pid| Process.kill('HUP', pid) }
  thread_count.times { Process.wait }
end

def offset_colors(graph, thread_count, offset)
  graph[:colors] = ((4**(graph[:connections].size - 1)) * (offset / thread_count.to_f)).to_i
  puts "Just got color #{graph[:colors].to_s(4).rjust(graph[:connections].size, '0')} on thread #{offset}"
end

def get_aware(graph)
  Thread.new do
    puts "Calculating...\nPlease press 'ctrl+D' to view status"
    loop do
      # gets.chomp
      # $stdin.read
      print graph[:colors].to_s(4).rjust(graph[:connections].size, '0') + "\r"
      # sleep 1
    end
  end
end

def get_color(graph, position)
  graph[:colors].to_s(4).rjust(graph[:connections].size, '0')[position]
end

def set_color(graph, position, color)
  raise 'Color out of bound exception' unless %w[0 1 2 3].include? color
  graph[:colors].to_s(4).rjust(graph[:connections].size, '0')[position] = color
end

def change_colors(graph)
  graph[:colors] += 1
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

def params
  raise 'Usage: ruby <program>.rb <process_count>' unless ARGV.size == 1
  begin
    { thread_count: Integer(ARGV[0]) }
  rescue ArgumentError
    raise 'The amount of processes to uses must be an integer'
  end
end

# puts params[:thread_count]
tiempo = Time.now
four_color_theorem(@graph)
puts Time.now - tiempo
# puts 'Colors: ' + @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
print_this @graph
# puts @graph[:colors]
