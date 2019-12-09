/*
Download and install node from http://nodejs.org/.
Run the interactive interpreter by typing `node`.

Part 1) Functional programming in JavaScript
Download http://cs.sjsu.edu/~austin/cs252-fall13/lab8/functional.js.
Implement the foldr, foldl, and map functions.
*/
//functional JavaScript
var addList = function(list){
    if(list.length === 0){
        return 0
    }   
    return list[0] + addList(list.slice(1))
   }
//map
var map = function(func,array){
    var result = []
    for( i = 0 ; i < array.length ;i++){
        result[i] = func(array[i])
    }
    return result
}
var arr = [0,1,2,3,4];
var add = function(a){
    return a+1;
}
console.log(map(add,arr));
console.log(map(function(a){return a*2},arr));
/**
[ 1, 2, 3, 4, 5 ]
[ 0, 2, 4, 6, 8 ]
 */

 //foldr: traverses from the right (foldr * 1 '(2 4 8)) is (* (2 (* 4 (* 8 1))))


/*
Part 2) Object-oriented programming in JavaScript.
Create a 'Student' constructor, like we did for Cat in class.
It should have the following fields:
*firstName
*lastName
*studentID
*display -- A function that prints out the firstName, lastName, and studentID number.
      To invoke it, you should call `student.display()`.

Create an array of new students.
Add a 'graduated' property to just one of your students.

Now create another student **without** using the constructor.
(In other words, use the object literal `{}` syntax).
Set the prototype chain manually using the __proto__ field.
Make sure the display method still works (without you having to add it to the object explicitly).
*/
