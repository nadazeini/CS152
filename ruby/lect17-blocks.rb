
file = File.open('temp.txt','r')
file.each_line do |line| #iterating in file as arrays, similar to taking anonymous function in java
    puts line
end
file.close

File.open('temp.txt','r') do |file| #this will close it down once its finished 
    # a block inside a block 
    #call std method  
    file.each_line {|line| puts line}
end
