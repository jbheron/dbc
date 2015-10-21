# models

class Teacher < ActiveRecord::Base
  has_many :classes
  has_many :students, :through => :classes
end

class Student < ActiveRecord::Base
  has_many :classes
  has_many :teachers, :through => :classes
end

class Class < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :student
end



# migrations

class CreateClasses < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :teachers do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :classes do |t|
      t.belongs_to :student
      t.belongs_to :teacher
      t.timestamps
    end
  end
end