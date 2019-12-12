function makeListOfAddersCorrect(lst){
    var arr = [];
    for(var i = 0; i < lst.length ; i++){
        (function(){
        var n = lst[i];
        arr[i] = function(x){
            return x + n;
        }
        })();
    }
    return arr;
}
console.log("Right: ");
var adders = makeListOfAddersCorrect([1,2,99,21]);
adders.forEach(function(adder){
    console.log(adder(100));
});
console.log("Wrong 1: \n");
function makeListOfAddersWrong1(lst){
    var arr = [];
    for(var i = 0 ; i < lst.length ; i++){
        var n = lst[i];
        arr[i] = function(x){
            return x + n;
        }
    }
    return arr;
}
var adders = makeListOfAddersWrong1([1,2,99,21]);
adders.forEach(function(adder){
    console.log(adder(100));
});
function test1(lst){
    var arr = [];
    for(var i = 0; i <lst.length ; i++){
        var n = lst[i];
        arr[i] = n;
    }
    return arr;
}
console.log(test1([1,2,3,4]))



/*es5 >> undefined vs ref error
console.log(hoist); //undefined
var hoist = 'here'; //if var is removed the console log before will cause error
                    //if var removed the console log after will print here

console.log(hoist); //prints here
*/