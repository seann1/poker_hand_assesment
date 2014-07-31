require('rspec')
require('poker_hand')


describe('poker_hand') do
  it("returns 'sorry, you have a bad hand!'' if no there is no winning hand in the array") do
    poker_hand(["9h", "7d", "8s", "4c", "6s"]).should(eq("you have a bad hand!"))
  end
end
