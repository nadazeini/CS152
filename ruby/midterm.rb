#chomp! return whatever between \r\n
puts "Ruby\rgiy\n".chomp! ##return giy
puts "f".chomp!

# inheritance in ruby
class Employee
    class << self
        def add(emp)
            puts "adding #{emp}"
            @employees = Hash.new unless @employees
            @employees[emp.name] = emp
        end
        def get_emp_by_name name
            @employees[name]
        end
    end
    attr_accessor :name, :ssid, :salary
    def initialize(name,ssid,salary)
        @name =  name
        @ssid = ssid
        @salary = salary
        Employee.add(self)
    end
    def to_s
        @name
    end
end

alice = Employee.new("Alice Alley",123,4523)
bob = Employee.new("Bob MArley",524,345235)

puts alice.ssid #prints id
puts bob #prints name

class << bob
    def signing_bonus
        2000
    end
end

puts(bob.signing_bonus)
#puts(alice.signing_bonus) causes error undefined
puts("here is employee by name: \n")
b = Employee.get_emp_by_name "Nada Zeini"
#puts(b.salary) #get error cause nil salary
c = Employee.get_emp_by_name "Alice Alley"
puts(c.salary) # prints salary of alice

eval "puts 2+3" # source of security problems
# instance_eval evaluates code within object body
# class_eval with class body
# takes a string or a block of code(block more secure)


s = "Hi, I'm Larry; this is my" + " brother Darryl, and this" + " is my other brother Darryl."
s.sub(/Larry/,'Laurent') 
puts s
s.sub!(/Larry/,'Laurent')
puts s
puts s.sub(/brother/, 'frère') 
puts s.gsub(/brother/, 'frère')

puts("\n");
puts("\n");
puts("\n");
puts("\n");


#Blocks

def do_noisy
    puts "About to call block"
    yield
    puts "Block called"
end
do_noisy  do
    puts 3+4
end

class Array 
    def each_downcase
        self.each do |word|
            yield word.downcase
        end
    end
end

["Alpha","Beta","AndSoON"].each_downcase do |word|
    puts word
end

def iff b
    return if b == false
    yield
end

def test_block
    iff true do
        puts "hello block"
        return 
    end
        puts "goodbye block"
end

def iff2 b, lam
    return if b == false
    lam.call
end

def test_lambda
    iff2 true, (lambda do 
        puts "hello lambda"
        return
    end)
    puts "goodbye lambda"
end

test_block
test_lambda


puts("\n\n\n\n\n")
class Person
    attr_accessor :name
def initialize(name)
  @name = name end
  def method_missing(m)
    puts "Didn't understand #{m}"
  end 
end

bob = Person.new "Robert" 

#bob.say_hi #Gives an error for an undefined method
class << bob
    def method_missing m 
        phrase = m.to_s.sub(/say_(.*)/, '\1') 
        puts phrase
    end 
end
bob.say_hi
bob.say_fancy
bob.say_goodnightGracie