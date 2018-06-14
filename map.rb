@graph = {
  '1' => {
    value: nil,
    connections: %w[3]
  },
  '2' => {
    value: nil,
    connections: %w[3 4 7]
  },
  '3' => {
    value: nil,
    connections: %w[1 2 4]
  },
  '4' => {
    value: nil,
    connections: %w[2 3 5 6 7]
  },
  '5' => {
    value: nil,
    connections: %w[4 6]
  },
  '6' => {
    value: nil,
    connections: %w[4 5 7]
  },
  '7' => {
    value: nil,
    connections: %w[2 4 6 8 9]
  },
  '8' => {
    value: nil,
    connections: %w[7 9 10 12 14 15]
  },
  '9' => {
    value: nil,
    connections: %w[7 8 10]
  },
  '10' => {
    value: nil,
    connections: %w[8 9 12]
  },
  '11' => {
    value: nil,
    connections: %w[17]
  },
  '12' => {
    value: nil,
    connections: %w[8 10 13 14]
  },
  '13' => {
    value: nil,
    connections: %w[12 14 20 21 22]
  },
  '14' => {
    value: nil,
    connections: %w[8 12 13 15 20]
  },
  '15' => {
    value: nil,
    connections: %w[8 14 16 19 20]
  },
  '16' => {
    value: nil,
    connections: %w[15 19]
  },
  '17' => {
    value: nil,
    connections: %w[11 18 28 29]
  },
  '18' => {
    value: nil,
    connections: %w[17 19 20 29 30]
  },
  '19' => {
    value: nil,
    connections: %w[15 16 18 20]
  },
  '20' => {
    value: nil,
    connections: %w[13 14 15 18 19 21 30]
  },
  '21' => {
    value: nil,
    connections: %w[13 20 22 24 25 26 30 31]
  },
  '22' => {
    value: nil,
    connections: %w[13 21 23]
  },
  '23' => {
    value: nil,
    connections: %w[22 26]
  },
  '24' => {
    value: nil,
    connections: %w[21 25 31 32]
  },
  '25' => {
    value: nil,
    connections: %w[21 24 26 27]
  },
  '26' => {
    value: nil,
    connections: %w[21 22 23 25 27]
  },
  '27' => {
    value: nil,
    connections: %w[25 26]
  },
  '28' => {
    value: nil,
    connections: %w[17 29 34 33]
  },
  '29' => {
    value: nil,
    connections: %w[17 18 28 30 34 35]
  },
  '30' => {
    value: nil,
    connections: %w[18 20 21 29 31 35 36 37]
  },
  '31' => {
    value: nil,
    connections: %w[21 24 30 32 37 38]
  },
  '32' => {
    value: nil,
    connections: %w[24 31 38]
  },
  '33' => {
    value: nil,
    connections: %w[28 34 39]
  },
  '34' => {
    value: nil,
    connections: %w[28 29 33 35 39 41]
  },
  '35' => {
    value: nil,
    connections: %w[29 30 34 36 41 43]
  },
  '36' => {
    value: nil,
    connections: %w[30 35 37 43]
  },
  '37' => { # this
    value: nil,
    connections: %w[30 31 36 38 43 45]
  },
  '38' => {
    value: nil,
    connections: %w[31 32 37 45]
  },
  '39' => {
    value: nil,
    connections: %w[33 34 40 41]
  },
  '40' => {
    value: nil,
    connections: %w[39 41 42 46 47 48]
  },
  '41' => {
    value: nil,
    connections: %w[34 35 39 40 42 43]
  },
  '42' => {
    value: nil,
    connections: %w[40 41 43 44 48]
  },
  '43' => {
    value: nil,
    connections: %w[35 36 37 41 42 45]
  },
  '44' => {
    value: nil,
    connections: %w[42 45 48 49]
  },
  '45' => {
    value: nil,
    connections: %w[37 38 43 44]
  },
  '46' => {
    value: nil,
    connections: %w[40 47]
  },
  '47' => {
    value: nil,
    connections: %w[40 46 48 49]
  },
  '48' => {
    value: nil,
    connections: %w[40 42 44 47 49]
  },
  '49' => {
    value: nil,
    connections: %w[44 47 48]
  }
}