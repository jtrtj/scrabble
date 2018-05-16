class Scrabble

  def score(word)
    1
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(word)
    count_score(word).flatten.sum
  end

  def score_with_multipliers(word, position, multiplier = 1)
    score = count_score(word).flatten
    array = score.zip(position).map do |s,p|
      s * p
    end
    array.sum * multiplier
  end

  def count_score(word)
    word_array = word.chars
    score = word_array.map do |letter|
     point_values.fetch_values(letter.upcase)
    end
    score
  end
end
