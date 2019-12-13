function Car(make, model, year){
    this.make = make;
    this.year = year;
    this.model = model;
    this.honk = function(){ console.log("honk!")}

}
Car.prototype.honk = function(){console.log("meep")}

var car1 = new Car("Chevy", "Nova");
var car2 = new Car ("Tesla","model S", 2014);
var car3 = Car("Ford","explorer",2001);

car1.honk(); //honk
car2.honk(); //honk
delete car2.honk;
car2.honk(); //meep
console.log(car1.year + "\n"); //undefined
console.log("examining car 3 here: \n");

//car3.honk();
console.log(year);//undefined
console.log(this.year);//car 3 year
console.log(car3.make);
console.log(car1.year);//undefined
console.log(car2.year);//2014 