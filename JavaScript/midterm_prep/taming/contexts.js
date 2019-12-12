
function print(){
   x = 8;
   var t = 342;
   console.log(y);  //undefined
   var y = 4;   
   console.log(x);//8
   console.log(t);//342
//console.log(u); // error
    u = 8;
}
//console.log(t); error
//console.log(x);//error
"use strict"
function bike() {
   console.log(this.name);
 }
 
 
 var obj1 = { name: "Pulsar", bike: bike };
 var obj2 = { name: "Gixxer", bike: bike };
 
 bike();           // "Ninja"
 obj1.bike();      // "Pulsar"
 obj2.bike();      // "Gixxer"
