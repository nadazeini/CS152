#inheritance in ruby
class Dog
    def initialize(name)
        @name = name
        
    end
    def speak
        puts "#{@name} says bark"
    end
end
rex = Dog.new('Rex')
rex.speak

class GuardDog < Dog
    attr_reader :breed #will get us getters method name will be breed
    def initialize (name,breed)
    super (name)
    @breed = breed
    end
 def attack
    puts "Growl"
 end
end
satan = GuardDog.new('Satan', 'Doberman')
puts "Satan is a #{satan.breed} "
satan.speak
satan.attack

#continue lecture
# RevString, ruby returns the last thing 
#blocks in ruby 
