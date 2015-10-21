# ruby review:

# data remembers stuff, either in individual pieces or groups
# loops (while, until, times) repeat things
# decisions (if, case) branch code flow

# functions label (iow. create names for ...) and delay execution of ... chunks of code
# parameters open holes for data in methods
# blocks are portable chunks of code
# lambdas and procs are code that can be packaged up and passed around like data

# oop review:

# classes are templates.  class names are singluar, not plural
# instances (objects) are made from those templates
# modules create namespaces and bundle related methods
# methods are functions attached to classes and instances

module Delightful  # modules bundle methods
  def ask
    "?"
  end

  def answer
    "!"
  end

  def smile
    ":)"
  end

  def weep_with_joy
    "boo hoo  :)"
  end
end

module DBC  # modules are used to create namespaces

  class Person
    def to_s
      "i'm a #{self.class}!"
    end
  end

  class Teacher < Person  # inheritance!  here it is again!
    include Delightful  # modules can be included

    attr_reader :name
    def initialize(args = {})
      @name = args[:name] || "Nameless Teacher"  # default values should be set
    end

    def to_s
      super + "  my name is #{name}"
    end
  end

  class Guest < Person # inheritance
    def to_s  # overriding a method from the parent (aka: super) class
      super + "  and i'm a guest here!"  # `super` refers to the method definition one level up the tree
    end
  end

  class Student < Person  # inheritance!  here it is
    attr_reader :name

    def initialize(name)
      @name = name || "New Student"
    end

    def to_s
      "hi, i'm a student and my name is #{name}"
    end
  end

  class Cohort
    MAX_SIZE = 30

    attr_reader :name, :students
    attr_accessor :in_session

    def initialize(args = {})
      @name = args[:name] || "New Cohort" # default value
      @students = args[:students] || []  # composition! here it is
      @in_session = args.fetch(:in_session, false)  # boolean params need careful treatment of defaults
    end
  end

  module SanFrancisco


    class Coach < Person

      Skill = Struct.new(:name, :level)

      attr_reader :name, :skills

      @active = []  # class instance variable

      class << self  # alternate way to express `def self.method_name`
        attr_reader :active

        def count
          @active.size
        end

        def request_help_on(topic)  # class method (ie. Coach.request_help_on('recursion'))
          coach = @active.detect {|coach| coach.skills.map(&:name).include? topic }
          return self.new unless coach
          coach
        end
      end

      def initialize(args = {})
        @name = args[:name] || "Nameless Coach"
        @skills = args[:skills] || [Skill.new(:kindness, :expert)]  # composition again!  Skill objects can go here

        self.class.active << self
      end


      def knows?(skill)
        @skills.map(&:name).include? skill.name  # using Symbol#to_proc
      end

      def to_s
        "hi, i'm #{name} and " + super
      end
    end

  end

  module Chicago

    class Mentor

      def initialize(args = {})
        @name = args[:name] || "Nameless Mentor"
      end
    end

  end
end

module ConsoleHelper  # modules bundle methods
  extend self # this creates methods on the module singleton (ie. ConsoleHelper.render('hi'))

  def render(text)
    puts text
  end

  def prompt(text)
    render(text)
    gets.chomp
  end

  def render_collection(coll)
    coll.each {|item| render(item) }
  end

  def break
    render("-"*10)
    self
  end
end

# ---

# ConsoleHelper.render('hi there, watch this...')
# name = ConsoleHelper.prompt("what's your name, by the way?")
# ConsoleHelper.render("great. hello, #{name}!")

# ---

ConsoleHelper.break.render('let\'s meet some teachers:')

teachers =  %w[anne brick derek rao shadi sherif steven strand]
              .map{|name| DBC::Teacher.new(name: name.capitalize)}

ConsoleHelper.render_collection(teachers)

# ---

ConsoleHelper.break.render("let's meet some students:")


students = %w[AlbertA AlbertW Alex Allison Ariel Arik Brian
              Bridgette Chandler Ernie Gannon Hethe Jared
              John Justin Kendall Lauren Matthew Michele
              Morgan Patrick Phillip Premila Puru Steven
              Tony William]
              .map{|name| DBC::Student.new(name)}

ConsoleHelper.render_collection(students)

# ---

ConsoleHelper.break.render("let's meet some coaches:")

coaches = %w[Guillaume Jason Johnny Katherine Ken Mathilde
             Nate Nick Salar Sam Stephen Tyler]
             .map{|name| DBC::SanFrancisco::Coach.new(name: name)}

ConsoleHelper.render_collection(coaches)

# ---

ConsoleHelper.break.render("let's skill-up the coaches ...")

tech = %i[ruby algos oop sql ux_ui html css javascript]
levels = %i[beginner intermediate advanced expert]

skill = DBC::SanFrancisco::Coach::Skill

coaches.each do |coach|
  tech.sample(rand(1...tech.length)).each do |t|
    coach.skills << skill.new(t, levels.sample)
  end
end

ConsoleHelper.render("there are #{DBC::SanFrancisco::Coach.count} coaches")

coaching_skills = coaches.map{|c| [c.name, c.skills.map(&:name).join(", ")].join(": ") }

ConsoleHelper.render_collection(coaching_skills)

# ---

ConsoleHelper.break.render("let's ask coaches for help:")

C = DBC::SanFrancisco::Coach

sql_expert = C.request_help_on(:sql)
dance_expert = C.request_help_on(:samba)

ConsoleHelper.render(sql_expert)
ConsoleHelper.render(dance_expert)

# ---

