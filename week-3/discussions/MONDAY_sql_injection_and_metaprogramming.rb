# metaprogramming to SQLite story

require 'sqlite3'
require 'faker'
require 'date'


`rm -f students.db`

$db = SQLite3::Database.new "students.db"

query = <<-SQL
  create table students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL
  )
SQL

$db.execute(query)

10.times do
  # fname = ('a'..'z').to_a.sample(rand(5..10)).join('')
  # lname = ('a'..'z').to_a.sample(rand(15..25)).join('')
  fname = Faker::Name.first_name #.gsub("'", "''")
  lname = Faker::Name.last_name #.gsub("'", "''")

  query = <<-SQL
    INSERT INTO students (first_name, last_name, birthday)
    -- VALUES ('#{fname}', '#{lname}')
    VALUES ("#{fname}", "#{lname}", '#{Time.now.strftime("%F")}')
  SQL
  $db.execute(query)
end



class Student
  def initialize(args = {})
    args.each do |var, val|
      instance_variable_set("@#{var}", val)
    end
  end

  def self.all
    records = []
    $db.prepare("select * from students").execute.each_hash do |row|
      records << Student.new(row)
    end
    records
  end
end

p Student.all


__END__
query = <<-SQL
  INSERT INTO students (first_name, last_name)

  VALUES ("John", "Smith"), ("Mary", "Smith");
SQL
$db.execute(query)


p $db.execute("select * from students")

# p $db.execute("select count(*) from students;")

# ----------------
# fname = "John"
# fname = "' OR 1 = 1;"
# ----------------

# query = "select * from students where first_name = '#{fname}'"
query = "select * from students where first_name = ? AND last_name = ?"
p query
# p $db.execute(query)

params = []
params << fname << "Smythe"
p params

p $db.execute(query, params)

# p $db.execute("select count(*) from students;")


__END__
def where(column, value)
  query = <<-SQL
    SELECT * FROM students
    WHERE #{column}
  SQL


end


where("first_name", "Brick")
