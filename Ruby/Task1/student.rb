require 'date'

class Student
  @@all = []
  
  attr_accessor:surname
  attr_accessor:name
  attr_accessor:date_of_birth
  
  def initialize(surame, name, date_of_birth)
    date = Date.parse(date_of_birth)
    raise ArgumentError, 'Invalid date' if date > Date.today
    @surname = surname
    @name = name
    @date_of_birth = date
    add_student
  end
  
  def add_student
    if !@@all.any?{ |s| s.surname == surname && s.name == name && s.date_of_birth == date_of_birth}
      @@all << self
    else
      raise ArgumentError, 'Student exists'
    end
  end
  
  def remove_student
    @@all.delete(self)
  end
  
  def calculate_age
    return Date.today.year - date_of_birth.year
  end
  
  def get_students_by_name(name)
    return @@all.select{|s| s.name == name}
  end
  
  def get_students_by_age(age)
    return @@all.select{|s| s.calculate_age() == age}
  end
end
