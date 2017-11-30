def round_adn_compare (number)
	one = number.round 2
	number = one - one.to_i
	number = number*100
	three = eval(sprintf("%8.0f",number))
	
	if three > 0 and three < 30
		puts three**2
	elsif 
		three > 30 and three < 60
		puts three**3
	else
		three > 60 and three < 100
		puts Math.sqrt(three)
	end
end
round_adn_compare(10.01)