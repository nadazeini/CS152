//The more standard way of adding JavaScript objects: first create a constructor
function Cat(name, breed) {
  this.name = name;
  this.breed = breed;
  this.speak = function() { console.log('meow!'); }
}

var garfield = new Cat('Garfield', 'Orange tabby');
console.log(garfield);
garfield.speak();

Cat.prototype.makeAngryNoise = function() {
  console.log('hiss');
}
garfield.makeAngryNoise();

Cat.prototype.sayName = function() {
  console.log("My name is " + this.name);
}
garfield.sayName();

garfield.favoriteFood = 'lasagna';

var animals = [garfield, new Cat('mimi', 'Calico'), new Cat("rex",'hicat')];

var forEach = function(arr,f) {
  var i;
  for (i=0; i<arr.length; i++) {
    f(arr[i]);
  }
}
console.log("Displaying all animals");
forEach(animals, console.log);

console.log("Each animal say your name");
forEach(animals, function(animal) {
  animal.speak();
  //animal.sayName(); // Won't work -- rex has no sayName method
  Cat.prototype.sayName.apply(animal);
});


Function.prototype.curry = function() {
  var slice = Array.prototype.slice,
      args = slice.apply(arguments),
      that = this;
  return function () {
    return that.apply(null, args.concat(slice.apply(arguments)));
  };
};
function add(a,b) {
    return a + b;
  }

var addOne = add.curry(1);
console.log(addOne(3));
