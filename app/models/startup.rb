require 'pry'

class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

    def pivot(domain, name)
      @domain = domain
      @name = name
    end

    def self.all
      @@all
    end

    def self.find_by_founder(founder_name)
      self.all.find do |startup|
        startup.founder == founder_name
      end
    end

    def self.domains
      self.all.map do |startup|
        startup.domain
      end
    end

    def sign_contract(venture_capitalist, type, investment)
      FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
      FundingRound.all.select do |funding_round|
        funding_round.startup == self
      end.length
    end

    def my_funds
      FundingRound.all.select do |funding_round|
        funding_round.startup == self
      end
    end

    def total_fund
      my_funds.inject(0) do |sum, funding_round|
        sum + funding_round.investment
      end
    end

    def investors
      my_funds.map do |fund|
        fund.venture_capitalist
      end.uniq
    end

    def big_investors
      investors.map do |investor|
        investor if VentureCapitalist.tres_commas_club.include?(investor)
      end.uniq.compact
    end

end
