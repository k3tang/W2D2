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
        @salaries.has_key?(title) ? true : false
    end 

    def >(startup)
        startup.funding < self.funding ? true : false 
    end 
            
    def hire(employee_name, title)
         if valid_title?(title)
           @employees << Employee.new(employee_name, title)
         else 
            valid_title?(title) == false
            raise NameError.new "invalid name"
        end 
    end 

    def size 
        @employees.count
    end 

    def pay_employee(employee)
        employee_title = employee.title
        employee_salary = @salaries[employee_title]
        if @funding > employee_salary
            employee.pay(employee_salary)
            @funding -= employee_salary
        else @funding < employee_salary
            raise StandardError.new "insufficient funds"
        end 
    end 

    def payday
        @employees.each {|emp| pay_employee(emp)}
    end 

    def average_salary
        sum = 0
      @employees.each do |emp|
       title = emp.title
        sum += @salaries[title]
      end 
        sum/self.size
    end 

    def close
        @employees = []
        @funding = 0
    end 

    def acquire(startup)
        @funding += startup.funding
       newsalaries = startup.salaries

       newsalaries.each do |k,v|
            if !(@salaries.has_key?(k))
                @salaries[k] = v
            end 
         end 
        

        @employees += startup.employees
        startup.close 
    end 

            
                



end
