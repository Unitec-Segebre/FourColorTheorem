@graph = {
  'a' => {
    value: nil,
    connections: %w[b c d]
  },
  'b' => {
    value: nil,
    connections: %w[a c d]
  },
  'c' => {
    value: nil,
    connections: %w[a b d]
  },
  'd' => {
    value: nil,
    connections: %w[a b c]
  }
}