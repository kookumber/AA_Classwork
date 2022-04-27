require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title) == false
            raise_error
        else
            @employees << Employee.new(name, title)
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee_name)
        if @funding > salaries[employee_name.title]
            employee_name.pay(salaries[employee_name.title])
            @funding -= salaries[employee_name.title]
        else
            raise_error
        end
    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        total_salary = 0
        @employees.each do |employee|
            total_salary += salaries[employee.title]
        end
        total_salary / @employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        (startup.salaries).each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end
        (startup.employees).each {|employee| @employees << employee}
        startup.close
    end
end
