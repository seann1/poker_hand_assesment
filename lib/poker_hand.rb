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

  full_house_begin = value[0..2].all? {|x| x == value[0]}
  full_house_two_begin = value[0..1].all? {|x| x == value[0]}
  full_house_two_end = value[3..4].all? {|x| x == value[3]}
  full_house_end = value[2..4].all? {|x| x == value[2]}
  consecutive = value.sort.each_cons(2).all? { |x,y| y == x + 1 }
  same_suit = suit.all? {|x| x == suit[0]}

  if full_house_begin && full_house_two_end
    fullhouse = true
    value.delete(0..4)
  elsif full_house_two_begin && full_house_end
    fullhouse = true
    value.delete(0..4)
  else
    fullhouse = false
  end

  2.times do |i|
    four_of_a_kind = value[i..(i + 3)].all? {|x| x == value[i]}
    if four_of_a_kind
      four_of_a_kind_counter += 1
    end
  end

  3.times do |i|
    three_of_a_kind = value[i..(i + 2)].all? {|x| x == value[i + 1] && x == value[i + 2] }
    if three_of_a_kind
      three_of_a_kind_counter += 1
    end
  end

  4.times do |i|
    two_of_a_kind = value[i..(i + 1)].all? {|x| x == value[i + 1]}
    if two_of_a_kind
      two_of_a_kind_counter += 1
    end
  end

  if consecutive && same_suit
    "straight flush"
  elsif four_of_a_kind_counter > 0
    "four of a kind"
  elsif fullhouse == true
    "full house"
  elsif same_suit
    "flush"
  elsif consecutive
    "straight"
  elsif three_of_a_kind_counter > 0
    "three of a kind"
  elsif two_of_a_kind_counter == 2
    "two pair"
  elsif two_of_a_kind_counter == 1
    "one pair"
  else
    "you have a bad hand!"
  end
end

poker_hand(["2d", "3d", "4d", "5d", "6d"])




