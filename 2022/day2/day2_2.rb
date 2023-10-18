# --- Part Two ---
# The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"
#
# The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:
#
# In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
# In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
# In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
# Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.
#
# Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?

games = File.read('./input.txt').split("\n").map(&:split)

points = { 'A' => 1, 'B' => 2, 'C' => 3 }

needs = {
  'C' => { 'X' => 'B', 'Y' => 'C', 'Z' => 'A' },
  'B' => { 'X' => 'A', 'Y' => 'B', 'Z' => 'C' },
  'A' => { 'X' => 'C', 'Y' => 'A', 'Z' => 'B' }
}

# x perde
# y empata
# z ganha
# [["A", "X"], ["B", "Z"], ["C", "Z"]]

score = 0
games.each do |player1, player2|
  player2 = needs[player1][player2]
  puts player2

  score += 3 if player1 == player2
  score += 6 if player2 == 'C' && player1 == 'B'
  score += 6 if player2 == 'A' && player1 == 'C'
  score += 6 if player2 == 'B' && player1 == 'A'

  score += points[player2]
  puts score
end

puts score # 13490

