#O(n!)
def anagram?(word1, word2)
  words = word1.chars.permutation(word1.length).to_a
  words.map(&:join).include?(word2)
end

#O(n^2) if delete uses a loop
def second_anagram?(word1, word2)
  word1.length.times do
    char = word1[0]
    word1.delete!(char)
    word2.delete!(char)
  end
  word1 == word2
end

#O(n^2)
def third_anagram?(word1, word2)
  word1.chars.sort.join == word2.chars.sort.join
end

#O(n)
def fourth_anagram(word1, word2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  word1.each_char {|letter| h1[letter] += 1}
  word2.each_char {|char| h2[char] += 1}
  h1 == h2
end
