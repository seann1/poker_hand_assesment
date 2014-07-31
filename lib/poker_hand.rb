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


    puts "you have a bad hand!"
    "you have a bad hand!"

end

poker_hand(["9h", "7d", "8s", "4c", "6s"])




