class VentureCapitalist

  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.select do |venture_capitalist|
      venture_capitalist.total_worth > 1000000000
    end
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.venture_capitalist == self
    end
  end

  def portfolio
    funding_rounds.map do |funding_round|
      funding_round.startup
    end.uniq
  end

  # - `VentureCapitalist#biggest_investment`
  #   - returns the largest funding round given by this venture capitalist
  def biggest_investment
    funding_rounds.sort_by do |funding_round|
      funding_round.investment
    end.last
  end

  def invested(domain)
    investment_arr = funding_rounds.map do |funding_round|
      funding_round.investment if funding_round.startup.domain ==  domain
    end.compact.inject(:+)
  end

end
