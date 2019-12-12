//A JavaScript Constructor
name = "Monty";
//function Rabbit(name){
 //   this.name = name;
//}
var r = Rabbit("Python"); //without new >> gives error
//console.log(r.name);
console.log(name); //prints python

function Rabbit(name,favFoods){
    this.name = name;
    this.myFoods = [];
        favFoods.forEach((food)=>
        this.myFoods.push(food) //this refers to the global scope
      );// >>gives errorz
}
var bugs = new Rabbit("Bugs",["carrots","lettuce","souls"]);
console.log(bugs.myFoods);