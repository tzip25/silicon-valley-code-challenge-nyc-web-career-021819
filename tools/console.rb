require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


startup1 = Startup.new("Amazing Widget", "Tali", "www.tali.com")
startup2 = Startup.new("Awesome Sauce", "Andrew", "www.andrew.com")

venture1 = VentureCapitalist.new("Josh's Fund", 300000000)
venture2 = VentureCapitalist.new("Teddy is a bear", 2000000000)

funding1 = FundingRound.new(startup1, venture1, "Seed", 20)
funding2 = FundingRound.new(startup2, venture1, "Series A", 800)
funding3 = FundingRound.new(startup1, venture2, "Series B", 100)
funding4 = FundingRound.new(startup2, venture2, "Series C", 7000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line
