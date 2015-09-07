class Employee
 attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    if !boss.nil?
      @boss.add_subordinate(self)
    end
  end

  def bonus(multiplier)
    bonus = @salary*multiplier
  end

end
class Manager < Employee
  attr_reader :subordinates

  def initialize(name, title, salary, boss)
    super
    @subordinates = []
  end

  def add_subordinate(subordinate)
    @subordinates << subordinate
    @boss.add_subordinate(subordinate) unless @boss.nil?
  end

  def bonus(multiplier)
    multiplier * @subordinates.inject(0) do |sum, employee|
      sum + employee.salary
    end
  end

end

ned = Manager.new("ned", "Founder", 1_000_000, nil)
darren = Manager.new("darren", "TA Manager", 78_000, ned)
shawna = Employee.new("shawna", "TA", 12_000, darren)
david = Employee.new("david", "TA", 10_000, darren)
p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
