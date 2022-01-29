# frozen_string_literal: true

# Models "Mastermind" game
class Game
  def initialize
    puts 'Welcome to matermind! Try to guess my code!'
    puts 'enter "q" at any time to quit'
    play
  end

  protected

  def play
    code = create_code
    p code
    12.times do
      print 'Enter a four digit code: '
      guess = gets.chomp
      return if guess == 'q'

      correct_code?(guess, code)
    end
    puts 'Game over. You lose!'
    new_game
  end

  private

  def create_code
    arr = []
    4.times do
      arr.push(rand(7))
    end
    arr.join
  end

  def correct_code?(guess, code)
    if guess == code
      puts 'That\'s correct. You win!'
      new_game
    else
      puts 'Not quite...'
      give_feedback(guess, code)
    end
  end

  def give_feedback(guess, code)
    correct_numbers = 0
    guess.chars.each do |element|
      correct_numbers += 1 if code.chars.include?(element)
    end
    puts "You got #{correct_numbers} digits correct."
  end

  def new_game
    puts "\nStarting new game..."
    Game.new
    exit(0)
  end
end

Game.new
