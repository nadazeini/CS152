var greet = 'Hello!'

function showGreet () {
  console.log(this.greet)
}

var casualGreet = { greet: 'Hey!' }

showGreet()                    // Hello!
showGreet.bind(casualGreet)()  // Hey!
showGreet.call(casualGreet)    // Hey!
showGreet.apply(casualGreet)   // Hey!

var x = 3;
function foo(y){
    console.log(this.x+y);
}
foo(100);
foo.apply(null,[100]);
foo.apply({x:4},[100]);//104 //changes this and arguments
foo.call({x:4},100);//104 no array need 
var bf = foo.bind({x:5});//creates a new function //same just different this
bf(60)

//forget var
function swap1(arr,i,j) {
    tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
    }
    function sortAndGetLargest1 (arr) {
    tmp = arr[0]; //largest elem //add var
    for (i=0; i<arr.length; i++) {
    if (arr[i] > tmp) tmp = arr[i]; for (j=i+1; j<arr.length; j++)
    if (arr[i] < arr[j]) swap1(arr,i,j); }
    return tmp; }
    var largest = sortAndGetLargest1([99,2,43,8,0,21,12]);
     console.log(largest); // should be 99, but prints 0
//fsemi colon insertion does strange things
function makeObject(){
    return{
        madeBy: 'Austion Tech. Sys.'
    }
}
var o = makeObject();
console.log(o.madeBy); //<< error should be here

//parse int wont warn you about problems
console.log(parseInt("42")); //42
console.log("what fo you get? " + parseInt("16 tons")); //16
console.log(parseInt("1oh1")); //1


//typeof null is 'object'

//typeof NaN is 'number'
console.log("hiomh"*7) //NaN

// == operator is not transitive
console.log('' == '0'); //false
console.log('0' == ''); //false
console.log(0 == '0'); //true
console.log(false == 'false'); //false
console.log(false == '0'); //true
console.log(false === 'false'); //false
console.log(false === '0'); //false now
console.log(0 === '0'); //false now 