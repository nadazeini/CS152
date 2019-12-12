function Reindeer(name){
    this.name = name;
}
var dasher = new Reindeer("Dasher");
var dancer = new Reindeer("Dancer");
var rudolph = new Reindeer("Rudolph");

rudolph.nose = "red";
Reindeer.prototype.nose = 'black'; //w/o prototype it's undefined

console.log(dancer.nose); //red
console.log(rudolph.nose); //black

var olive =  new Reindeer("the other reindeer"); //forgot to call new
console.log(olive);
//console.log(olive.nose);
console.log(name);