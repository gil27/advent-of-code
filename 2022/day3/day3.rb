# frozen_string_literal: true

input = File.read('./input.txt').split("\n")

lower = ('a'..'z').to_a
capital = ('A'..'Z').to_a
score = (lower + capital).zip((1..52).to_a).to_h

input.map do |line|
  size = line.size / 2
  first = line[..(size - 1)]
  last = line[size..]

  score[first.chars.intersection(last.chars).first]
end.sum

# 7863

