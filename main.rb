require_relative './Game'

  puts "Welcome to my lovely math challenge game I hope you have fun"

  player1 = Player.new("BOB")
  player2 = Player.new("John")
  game = Game.new(player1, player2)

  puts game.start