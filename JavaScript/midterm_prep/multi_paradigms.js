//imperative
function addList(list){
    var i, sum = 0;
    for(i = 0 ; i < list.length ; i++){
        sum += list[i];
    }
    return sum;
}
//functional JavaScript
var addList = function(list){
 if(list.length === 0){
     return 0
 }   
 return list[0] + addList(list.slice(1))
}
//Object Oriented JavaScript
function Adder(amount){
    this.amount = amount
}
Adder.prototype.add = function(x){
    return this.amount + x
}
var myAdder = new Adder(1)
var y = myAdder.add(7)
console.log(y)