// the more standard way of adding JavaScript objects: first create a constructor
function Cat(name,breed){ //notice capital letter
    this.name = name;
    this.breed = breed;
    this.speak = function(){
        console.log('meow!')
    }
}
//make new cat
var garfield = new Cat('Garfield','Orange Cat');
console.log(garfield) //prints Cat { name: 'Garfield', breed: 'Orange Cat', speak: [Function] }
garfield.speak()
Cat.prototype.makeAngryNoise = function(){
    console.log('making angry noise')
}
garfield.makeAngryNoise()
Cat.prototype.sayName = function() {
    console.log("My name is " + this.name);
  }
garfield.sayName();
garfield.favoriteFood = 'lasagna'; //now it's added 
console.log(garfield)
/*Cat {
  name: 'Garfield',
  breed: 'Orange Cat',
  speak: [Function],
  favoriteFood: 'lasagna' }
 */
var meredith = new Cat('Meredith','Scottish','Pasta') //pasta doesnt appear cause not part of constructor
//unless you add it like meredith.favoriteFood = 'Pasta'
console.log(meredith)
meredith.makeAngryNoise()
meredith.speak()


let rabbit = {};
rabbit.speak = function(line) {
  console.log(`The rabbit says '${line}'`);
};

rabbit.speak("I'm alive.");
// → The rabbit says 'I'm alive.'

function speak(line) {
    console.log(`The ${this.type} rabbit says '${line}'`);
  }
  let whiteRabbit = {type: "white", speak};
  let hungryRabbit = {type: "hungry", speak};
  
  whiteRabbit.speak("Oh my ears and whiskers, " +
                    "how late it's getting!");
  // → The white rabbit says 'Oh my ears and whiskers, how
  //   late it's getting!'
  hungryRabbit.speak("I could use a carrot right now.");
  // → The hungry rabbit says 'I could use a carrot right now.'
  speak.call(hungryRabbit, "Burp!");
// → The hungry rabbit says 'Burp!'
