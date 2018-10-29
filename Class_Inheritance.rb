class Employee
  attr_accessor :salary, :name, :title, :boss
  
  def initialize(name, title, salary = 0, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end
  
  def bonus(multiplier)
    self.salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :lower_employees
  
  def initialize(name, title, salary = 0, boss = nil)
    @lower_employees = []
    super
  end
  
  def add_employees(employee)
    @lower_employees << employee
  end
  
  def bonus(multiplier)
    result = []
    @lower_employees.each do |employee|
      if employee.is_a?(Manager)
        result << employee.bonus(1) + employee.salary
      else
        result << employee.salary
      end
    end
    result.reduce(:+) * multiplier
  end
end

if __FILE__ == $PROGRAM_NAME
ned = Manager.new("Ned", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned.add_employees(darren)
darren.add_employees(shawna)
darren.add_employees(david)
end