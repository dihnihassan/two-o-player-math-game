require './players'
require './game_questions'


class Game 

  def initialize
    @player1 = Players.new("Player 1") 
    @player2 = Players.new("Player 2")
    @current_player = @player1 
    
  end

  def run_game

  q =  GameQuestions.new
  puts "#{@current_player.name}: What is #{q.num1} + #{q.num2}?"
  
  print "> "
  input = gets.chomp
  
  answered_question(input.to_i, q.answer, @current_player)

  display_stats

  if @current_player.lives == 0
  end_game
  else
  switch_player
  run_game
  end
 
  end

    def answered_question(input, answer, player)
      if input == answer
        puts "YES! You are correct."
      else
        player.reduce_lives
      end
    end

    def display_stats
     puts "P1 #{@player1.lives} vs P2 #{@player2.lives}" 
    end

    def switch_player
      if @current_player.name == "Player 1"
          @current_player = @player2
      else 
          @current_player = @player1
        end
    end

def end_game
 if @player1.lives > @player2.lives
  puts "#{@player1.name} wins!"
 else
  puts "#{@player2.name} wins!"
 end

end 

        
    end
