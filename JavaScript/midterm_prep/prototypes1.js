console.log(Object.getPrototypeOf({}) ==
            Object.prototype);
// → true
console.log(Object.getPrototypeOf({}));
console.log(Object.getPrototypeOf([]) == Array.prototype);

let empty = {};
console.log(empty.toString);
// → function toString(){…}
console.log(empty.toString());
// → [object Object]

function Rabbit(type) {
    this.type = type;
  }
  Rabbit.speak = function(line) {
    console.log(`The ${this.type} rabbit says '${line}'`);
  };
  
  let weirdRabbit = new Rabbit("weird");
  weirdRabbit.speak("yo")