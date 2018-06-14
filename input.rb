@graph = {
  'a' => {
    value: nil,
    connections: %w[b c]
  },
  'b' => {
    value: nil,
    connections: %w[a d j]
  },
  'c' => {
    value: nil,
    connections: %w[a d e f]
  },
  'd' => {
    value: nil,
    connections: %w[c b h]
  },
  'e' => {
    value: nil,
    connections: %w[c g q]
  },
  'f' => {
    value: nil,
    connections: %w[c g h]
  },
  'g' => {
    value: nil,
    connections: %w[e f i]
  },
  'h' => {
    value: nil,
    connections: %w[d f i j]
  },
  'i' => {
    value: nil,
    connections: %w[g h k l q r]
  },
  'j' => {
    value: nil,
    connections: %w[b h k]
  },
  'k' => {
    value: nil,
    connections: %w[i j n]
  },
  'l' => {
    value: nil,
    connections: %w[i m n]
  },
  'm' => {
    value: nil,
    connections: %w[l n r]
  },
  'n' => {
    value: nil,
    connections: %w[k l m o t]
  },
  'o' => {
    value: nil,
    connections: %w[n]
  },
  'p' => {
    value: nil,
    connections: %w[q]
  },
  'q' => {
    value: nil,
    connections: %w[e i p]
  },
  'r' => {
    value: nil,
    connections: %w[i m s t]
  },
  's' => {
    value: nil,
    connections: %w[r]
  },
  't' => {
    value: nil,
    connections: %w[n r]
  }
}