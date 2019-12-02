def conversion_chart(from_units,to_units,values)
    puts "#{from_units}\+#{to_units}"
    left_line = right_line = ""
    from_units.length.times {left_line += '-'}
    puts "#{left_line}\+#{right_line}"
    for val in values 
        converted = yield val
        puts "#{val}\+#{converted}"
    end
    puts
end
conversion_chart("km","miles",(1..10)) do |km|
    0.621371 * km
    end
#      km           miles
#      --           -----
#       1           0.621371
#       2           1.2..

class Employee
    #added code
    class << self #refers to class self
    def add(emp) #method added to the class itself like static in java
        puts "Adding #{emp}"
        @employees = Hash.new unless @employees #unless employees doesnt exist yet create a new hash
        @employees[emp.name]=emp

    end
    def get_empty_name(name)
        @employees[name]
    end



    #end added
    attr_accessor :home,:ssid,:salary
    def initialize(name,ssid,salary)
        @name = name
        @ssid = ssid
        @salary = salary
        #added
        Employee.add(self)
    end
    def to_s
        @name 
    end
end
alice = Employee.new("Alice Alley", 1234, 75000)
bob = Employee.new("Robert Tables",5678,50000)
class << bob
    def signing_bonus
        2000
    end
end

##added
b = Employee.get_emp_by_name "Robert Tables"
puts b.signing_bonus