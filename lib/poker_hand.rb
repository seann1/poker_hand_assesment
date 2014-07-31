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
  three_of_a_kind_counter = 0
  four_of_a_kind_counter = 0

  consecutive = value.sort.each_cons(2).all? { |x,y| y == x + 1 }
  same_suit = suit.all? {|x| x == suit[0]}

  2.times do |i|
    four_of_a_kind = value[i..(i + 3)].all? {|x| x == value[i]}
    if four_of_a_kind
      four_of_a_kind_counter += 1
    end
  end

  3.times do |i|
    three_of_a_kind = value[i..(i + 2)].all? {|x| x == value[i]}
    if three_of_a_kind
      three_of_a_kind_counter += 1
    end
  end

  4.times do |i|
    two_of_a_kind = value[i..(i + 1)].all? {|x| x == value[i]}
    if two_of_a_kind
      two_of_a_kind_counter += 1
    end
  end


  if same_suit
    "flush"
  elsif four_of_a_kind_counter > 0
    "four of a kind"
  elsif consecutive
    "straight"
  elsif three_of_a_kind_counter > 0
    "three of a kind"
  elsif two_of_a_kind_counter >= 2
    "one pair"
  else
    puts "you have a bad hand!"
    "you have a bad hand!"
  end
end

poker_hand(["9d", "9d", "9d", "9d", "6d"])




