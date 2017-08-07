require 'byebug'

class Employee
  attr_accessor :salary, :boss, :name

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end


end

class Manager < Employee

  def initialize(employees = [], name, title, salary, boss)
    @employees = employees
    super(name, title, salary, boss)
  end

  def bonus(multiplier)
    get_salaries.reduce(&:+) * multiplier
  end

  def add_employee(employee)
    @employees << employee
    employee.boss = self.name
  end

  def get_salaries
    result = []
    @employees.each do |employee|
      employee.is_a?(Manager) ?
        result += [employee.salary] + employee.get_salaries : result << employee.salary
    end
    result
  end
end


if __FILE__ == $PROGRAM_NAME

ned = Manager.new([], "ned",'founder', 1_000_000_000, nil)

m = Manager.new([], 'greedy boss', 'overlord', 1_000_000, nil)

sad_adrian = Employee.new('sad_adrian', 'office_slave', 0.001, nil)

# debugger
ned.add_employee(m)
m.add_employee(sad_adrian)

p ned.bonus(10) #100_000


end
