class Scoring
  #some sort of data structure to store the individual letter scores
  SCORE_CHART = {
    "A"=>1, "B"=>3, "C"=>3, "D"=>2,
    "E"=>1, "F"=>4, "G"=>2, "H"=>4,
    "I"=>1, "J"=>8, "K"=>5, "L"=>1,
    "M"=>3, "N"=>1, "O"=>1, "P"=>3,
    "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8,
    "Y"=>4, "Z"=>10
  }

  def self.score(word)
    word_array = word.upcase.split("")

    word_score = 0
    #validity of entry

    # if word.length <= 7
      word_array.each do |letter|
        word_score += SCORE_CHART[letter]
    #returns score value for given word. word input as string.
      end
    #seven letter word get 50point bonus
      word.length >= 7 ? word_score += 50 : word_score
    # end
    return word_score
  end

  def self.score_many(words)
    #words = "melissa suz"
    words = words.split(" ")
    # words = ["melissa", "suz"]
    words_hash ={}
    words.each do |word|
      words_hash[word] = self.score(word)
    end
    return words_hash
      # @word_score = Scoring.score(words["word"])
      # @word = words["word"]
  end

  def self.letter_by_letter(word)
    letters = word.upcase.chars
    letters.map do |letter|
      {letter => SCORE_CHART[letter]}
    end
  end

  def self.highest_score_from(array_of_words)
    win_score = 0
    win_word = array_of_words[0]


    array_of_words.each do |word|
      score_inst = self.score(word)
      #checks if current winning score is less than or equal
      #to the current word's score, then uses the tiebreaker
      #conditions to determine winning word and score
      if score_inst > win_score
        win_score = score_inst
        win_word = word
      elsif score_inst == win_score && word.length < win_word.length
        win_word = word
        win_score = score_inst
      end
    end
    return win_word

  end
end
