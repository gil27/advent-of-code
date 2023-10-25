# frozen_string_literal: true

input = File.read('./input.txt').split("\n")

lower = ('a'..'z').to_a
capital = ('A'..'Z').to_a
score = (lower + capital).zip((1..52).to_a).to_h
res = []
input.each_slice(3) do |lines|
  res << score[lines.map(&:chars).inject(&:intersection).first]
end

res.sum

# 2488
