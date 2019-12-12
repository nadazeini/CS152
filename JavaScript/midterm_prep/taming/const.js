function Rabbit(name,favFoods){
    this.name = name;
    this.myFoods = [];
        favFoods.forEach(function(food){
        this.myFoods.push(food); //this refers to the global scope
      });// >>gives errorz
}
var bugs = new Rabbit("Bugs",["carrots","lettuce","souls"]);
console.log(bugs.myFoods);