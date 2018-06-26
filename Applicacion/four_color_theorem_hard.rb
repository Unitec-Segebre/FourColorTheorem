require 'set'
load 'weird_hard.rb'
# load 'circle_hard.rb'

def four_color_theorem(graph)
  # get_aware graph
  loop do
    # puts @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
    break if solved? graph
    change_colors graph
    raise 'No hay mas colores' if graph[:colors] == 4**graph[:connections].size
  end
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

tiempo = Time.now
four_color_theorem(@graph)
puts Time.now - tiempo
# puts 'Colors: ' + @graph[:colors].to_s(4).rjust(@graph[:connections].size, '0')
print_this @graph
