
class Player

  @history = []

  def self.register
    UI.render('welcome player!')
    name = UI.prompt('please enter your name ...')
    @name = name
  end

  def self.correct!
    @history << true
    p @history
  end

  def self.incorrect!
    @history << false
  end

  def self.streak
    streak = 0
    longest_streak = 0

    @history.each do |answer|
      longest_streak = streak if streak > longest_streak
      streak = answer ? streak + 1 : 0
    end

    longest_streak
  end

  def self.incorrect_message
    "you suck!"
  end

  def self.correct_message
    message = <<-MSG
      nice.
      OMG!! 3 in a row!!
      ZOMG!!! 5 in a row!!!
      OMZOMG!!!! YOU TOTALLY OWNED THIS!!!!
    MSG
    messages = message.split("\n").map(&:strip)

    streak_map = {3 => 1, 5 => 2, 10 => 3}

    msg = streak_map[streak] || 0
    messages[msg]
  end
end

class Card
  def initialize(args = {})
    @question = args[:question]
    @answer = args[:answer]
  end

  def check(guess)
    guess == @answer
  end
  alias_method :correct?, :check

  def to_s
    @question
  end
end

class Deck
  @cards = []

  def self.cards
    @cards
  end

  def self.add(card)
    @cards << card
  end

  def self.has_cards?
    !@cards.empty?
  end

  def self.next
    @cards.pop
  end
end

class Database
  def self.load(file)
    File.readlines(file).each_slice(3) do |line|
      question, answer = line.map(&:chomp)[0..1]
      card = Card.new(question: question, answer: answer)
      Deck.add(card)
    end

    Deck # return Deck class as singleton holding all cards
  end
end

class UI
  TIMEOUT = 0.5
  def self.welcome
    message = <<-TEXT
      Welcome to Flash Cards!
      Type in the answer to each question or type hint for the first letter
      Then press 'return'
      Type 'exit' to exit the game
      -----------------
    TEXT
    messages = message.split("\n").map(&:strip)
    messages.each do |msg|
      self.render msg
      sleep TIMEOUT
    end
    puts
  end

  def self.prompt(content)
    render content
    print "---> "
    response = $stdin.gets.chomp
    render
    response
  end

  def self.render(content = "")
    puts content
  end

  def self.new_line
    render
  end
end

module Game
  extend self

  def run(file)
    UI.welcome
    Player.register

    # load questions
    deck = Database.load(file)


    while deck.has_cards?

      # prompt first question
      # and get user input as guess
      card = deck.next
      guess = UI.prompt(card)

      # check guess
      # prompt user right / wrong
      if card.correct?(guess)
        Player.correct!
        UI.render Player.correct_message

      else
        Player.incorrect!
        UI.render Player.incorrect_message
      end

      UI.new_line
    end
  end
end

# --------------------------------

file = ARGV.first + '.txt'
Game.run(file)

