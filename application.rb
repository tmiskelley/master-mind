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
    12.times do
      print 'Enter a four digit code, numbers between 1 and 6: '
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
    correct_digits = 0
    correct_spots = 0
    guess.chars.each_with_index do |element, i|
      correct_digits += 1 if guess.chars.sort[i] == code.chars.sort[i]
      correct_spots += 1 if code.chars[i] == element
    end
    puts "#{correct_digits} digits are correct."
    puts "#{correct_spots} digits in the correct spots."
  end

  def new_game
    puts "\nStarting new game..."
    Game.new
    exit(0)
  end
end

Game.new
