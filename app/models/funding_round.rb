class FundingRound

  attr_reader :startup, :venture_capitalist, :investment
  attr_accessor :type
  @@all = []

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment.to_f
    @@all << self
  end

  def self.all
    @@all
  end

  def investment=(investment)
    if investment > 0
      @investment = investment.to_f
      @investment
    elsif investment < 0
      puts "Invalid amount"
      @investment = 0
    end
    @investment
  end

  # - `FundingRound#investment`
  #   - returns a **number** that is the amount invested during this funding round
  #   - This should be a float that is not a negative number.

end
