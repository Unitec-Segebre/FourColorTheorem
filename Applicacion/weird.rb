@graph = {
  '0' => {
    value: nil,
    connections: %w[1 2 3 4 5]
  },
  '1' => {
    value: nil,
    connections: %w[0 2 5]
  },
  '2' => {
    value: nil,
    connections: %w[0 1 3 5 6 7]
  },
  '3' => {
    value: nil,
    connections: %w[0 2 4 7]
  },
  '4' => {
    value: nil,
    connections: %w[0 3 5 7]
  },
  '5' => {
    value: nil,
    connections: %w[0 1 2 4 6 7]
  },
  '6' => {
    value: nil,
    connections: %w[2 5 7]
  },
  '7' => {
    value: nil,
    connections: %w[2 3 4 5 6]
  }
}