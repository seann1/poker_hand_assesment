require('rspec')
require('poker_hand')


describe('poker_hand') do
  it("returns 'sorry, you have a bad hand!'' if no there is no winning hand in the array") do
    poker_hand(["9h", "7d", "8s", "4c", "6s"]).should(eq("you have a bad hand!"))
  end

  it("returns 'one pair' if two cards in the hand have the same value") do
    poker_hand(["8h", "8h", "10s", "4h", "6d"]).should(eq("one pair"))
  end

  it("returns 'three of a kind' if three cards in a hand have the same value") do
    poker_hand(["9h", "9d", "9s", "4c", "6s"]).should(eq("three of a kind"))
  end

  it("returns 'four of a kind' if four cards in a hand have the same value") do
    poker_hand(["9h", "9d", "9s", "9c", "6s"]).should(eq("four of a kind"))
  end

  it("returns 'straight' if values in hand ascend in consecutive order") do
    poker_hand(["3h", "4d", "5s", "6c", "7s"]).should(eq("straight"))
  end

  it("returns 'flush' if values in hand are all of the same suit") do
    poker_hand(["3d", "4d", "10d", "6d", "7d"]).should(eq("flush"))
  end

  it("returns 'full house' if three of a kind and pair in hand") do
    poker_hand(["3d", "3d", "3d", "4d", "4d"]).should(eq("full house"))
  end

  it("returns 'straight flush' if cards ascend in consecutive order and are all of the same suit") do
    poker_hand(["2d", "3d", "4d", "5d", "6d"]).should(eq("straight flush"))
  end
end
