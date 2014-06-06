#RPS

#I thought about a player and game class but I wasn't sure how to have an endless call of games and also
#I felt it would've been harder to keep score that way as well. So I just went with a Player class which 
#had the attributes score and hand to keep track of. This class is where I implemented the fuctionality to 
#make one player(the computer) have a random hand.
class Player
  
  attr_accessor :score, :hand

  def initialize(score, hand = nil)
  	self.score = score
  	self.hand = hand
  end

  def computer_random
    hands = ["rock", "paper", "scissors", "lizard", "spock"]
    hands.sample
  end
end

#method thats plays the game. Probably should've used When/Case but I like elsifs 
def play

  win = "\nYou Win! The computer picked #{@computer.hand.capitalize} and you picked #{@player1.hand.capitalize}\n"
  lose = "\nYou Lose! The computer picked #{@computer.hand.capitalize} and you picked #{@player1.hand.capitalize}\n"

  if @player1.hand == @computer.hand
    @message = "It was a Draw\n"
  elsif @player1.hand == "rock"
  	if @computer.hand == "paper" || @computer.hand == "spock"
  	  @computer.score += 1
  	  @message = lose
  	else
  	  @player1.score += 1
  	  @message = win
  	end
  elsif @player1.hand == "paper"
  	if @computer.hand == "scissors" || @computer.hand == "lizard"  	
      @computer.score += 1
      @message = lose 
    else
      @player1.score += 1
      @message = win
    end
  elsif @player1.hand == "scissors"
    if @computer.hand == "rock" || @computer.hand == "spock"
      @computer.score += 1
      @message = lose
    else
      @player1.score += 1
      @message = win
    end
  elsif @player1.hand == "spock"
    if @computer.hand == "lizard" || @computer.hand == "paper"
      @computer.score += 1
      @message = lose
    else
      @player1.score += 1
      @message = win
    end
  elsif @player1.hand == "lizard"
  	if @computer.hand == "scissors" || @computer.hand == "rock"
  	  @computer.score += 1
  	  @message = lose
  	else
      @player1.score += 1
      @message = win
  	end
  else
    @message = "You didn't enter either Rock, Paper, Scissors, Lizard, or Spock\n"	
  end

  puts @message += "Score - You: #{@player1.score}, Computer: #{@computer.score}\n\n"    	    
end

#initial hand request
#Used downcase to limit conditionals later on.
puts "Choose either Rock, Paper, Scissors, Lizard, Spock to play or Q to Quit"
input = gets.chomp.downcase

#inialize player and computer
@player1 = Player.new(0, input)
@computer = Player.new(0)
@message = ""

#endless loop to keep playing unless q is entered
#had to put computer_random in loop in order to get
#random hand each turn.
while input != 'q'	
  @computer.hand = @computer.computer_random
  play
  puts "Choose either Rock, Paper, Scissors, Lizard, Spock to play or Q to Quit"
  input = gets.chomp.downcase
  @player1.hand = input
end  


