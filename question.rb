class Question
  attr_reader :question, :answer
    def initialize ()
      @num1 = rand(1..20)
      @num2 = rand(1..20)
      @question = "What is #{@num1} + #{@num2}"
      @answer = @num1 + @num2
    end
  def correct?(player_answer)
    if player_answer == @answer
      puts "DING DING DING #{player_answer} is correct nerd"
      true
    else
      puts "Incorrect answer -1 life sorry"
      puts "correct Answer was #{@answer}"
      false
    end
  end
end
