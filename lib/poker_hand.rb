def poker_hand(hand)
  value = []
  suit = []

  hand.each do |i|
    if i.length == 3
      value << 10
      suit << i[-1]
    else
      if i[0] == "j"
        value << 11
        suit << i[1]
      elsif i[0] == "q"
        value << 12
        suit << i[1]
      elsif i[0] == "k"
        value << 13
        suit << i[1]
      elsif i[0] == "a"
        value << 14
        suit << i[1]
      else
        value << i[0].to_i
        suit << i[1]
      end
    end
  end


  value = value.sort
  puts value

  two_of_a_kind_counter = 0

  4.times do |i|
    two_of_a_kind = value[i..(i + 1)].all? {|x| x == value[i]}
    if two_of_a_kind
      two_of_a_kind_counter += 1
    end
  end

  if two_of_a_kind_counter >= 1
    "one pair"
  else
    puts "you have a bad hand!"
    "you have a bad hand!"
  end
end

poker_hand(["9h", "9d", "8s", "4c", "6s"])



