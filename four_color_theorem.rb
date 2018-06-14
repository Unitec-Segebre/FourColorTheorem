require 'set'
load 'circle.rb'
@to_visit = Set[]
@colored = Set[]

def four_color_theorem
  @to_visit.add(popular_node)
  while @to_visit.any?
    current = @to_visit.to_a.first
    color_node current, available_colors(current)
    @to_visit -= @colored
  end
end

def paint(node, color)
  @graph[node][:value] = color
end

def color_node(node, available_colors)
  color = available_colors.to_a.first
  raise 'No colors left' if color.nil?
  paint node, color
  @colored.add(node)
end

def neighbor_colors(root)
  colors = Set[]
  @graph[root][:connections].each { |node| colors.add(@graph[node][:value]) }
  colors.delete(nil)
end

def available_colors(root)
  colors = [1, 2, 3, 4]
  @graph[root][:connections].each do |node|
    colors.delete(@graph[node][:value])
    @to_visit.add(node) # Should not be here but makes it efficient
  end
  colors
end

def popular_node
  popular = { key: @graph.keys.first, value: @graph.values.first[:connections].size }
  @graph.each do |k, v|
    size = v[:connections].size
    popular = { key: k, value: size } if size > popular[:value]
  end
  popular[:key]
end

def print_graph
  @graph.each do |node, data|
    puts node + ': ' + data[:value].to_s
  end
end

four_color_theorem
print_graph
