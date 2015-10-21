# - load the file and discover the fields we need in Person
# - dynamically structure Person based on the fields in the file
# - write the save method

require 'csv'

class Person
  # What attributes should a Person object have?
  # attributes will be dynamic
  @max_id = 0

  class << self
    attr_reader :headers
  end

  def self.from_csv(row)
    @headers = row.headers
    from_data(row)
  end

  def self.from_hash(hash)
    @headers = hash.keys
    from_data(hash)
  end

  def self.from_data(data)
    person = self.new
    @headers.each do |header|
      person.instance_variable_set("@#{header}".to_sym, data[header])
      @max_id = data[header].to_i if header == :id && data[header].to_i > @max_id
    end
    person.instance_variable_set(:@id, @max_id + 1) unless person.instance_variables.include? :id
    person
  end

  def to_csv
    self.instance_variables.map{|v| self.instance_variable_get(v) }
  end

end

class PersonParser
  attr_reader :file

  def initialize(file)
    @file = file
    @people = nil
  end

  def people
    # If we've already parsed the CSV file, don't parse it again.
    # Remember: @people is +nil+ by default.
    return @people if @people

    # We've never called people before, now parse the CSV file
    # and return an Array of Person objects here.  Save the
    # Array in the @people instance variable.
    @people = []
    CSV.foreach(file, headers: true, header_converters: :symbol) do |row|
      @people << Person.from_csv(row)
    end
    @people
  end

  def save
    CSV.open(@file, 'w') do |file|
      file << Person.headers
      @people.each do |person|
        file << person.to_csv
      end
    end
  end
end

parser = PersonParser.new('people.csv')

puts "There are #{parser.people.size} people in the file '#{parser.file}'."

data = ["Smith", "Jane", "abc@123.com", "1-906-235-0832", "2013-07-06T07:23:09-07:00"]
new_person = Hash[Person.headers[1..-1].zip(data)]  # ignore the id here
parser.people << Person.from_hash(new_person)

puts "There are #{parser.people.size} people in the file '#{parser.file}'."

parser.save

