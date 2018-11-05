require_relative './player'
require_relative './question'

class Game
  attr_reader :ask_question, :currentPlayer
  attr_accessor :player1, :player2
  def initialize (player1,player2)
    @player1 = player1
    @player2 = player2
    @turn = 0
    @currentPlayer = player1
  end

  def ask_question(quest)
    puts quest.question
    player_answer = $stdin.gets.chomp.to_i
    if quest.correct?(player_answer)
      @currentPlayer.add_point
      puts "#{@currentPlayer.name} now has #{@currentPlayer.points} points"
    else
      @currentPlayer.lose_life
      puts "#{@currentPlayer.name} now has #{@currentPlayer.lives} lives left"
    end
  end

  def play
    while (not game_over?) do
      @turn += 1
      if @currentPlayer == player1
        @currentPlayer = player2
      else
        @currentPlayer = player1
      end

      puts "Current lives left are:"
      puts "#{@player1.name} has #{@player1.lives}/3 lives"
      puts "#{@player2.name} has #{@player2.lives}/3 lives"
      puts "-----#{@currentPlayer.name}'s turn-----"
      self.ask_question(Question.new())
      # end
      self.game_summary
    end
  end

  def game_over?
    @currentPlayer.lives == 0
  end

  def game_summary
    puts ""
    puts "-----GAME OVER #{@currentPlayer.name} DIED-----"
    puts ""
    puts "#{@player1.name} finished with #{@player1.points} points"
    puts "#{@player2.name} finished with #{@player2.points} points"
    puts ""
    puts "This game lasted #{@turn} turns"
  end

  def start
    puts "Welcome to my lovely math challenge game I hope you have fun"
    puts "First player is #{player1.name}"
    puts "Second player is #{player2.name}"
    self.play
  end

end




