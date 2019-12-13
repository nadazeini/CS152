function mystery(n) {
    var curPos = 2, lst = [], i;
    for (i=curPos; i<n; i++) lst[i]=i; return function() {
    var x;
    console.log(curPos);
    console.log("x is "+ x);
    while (lst[curPos] === undefined) {
     if (curPos > n) throw new Error("Nothing left");
     console.log("currPos before adding" + curPos);
    curPos++; 
    console.log("currPos after adding" + curPos);}
    x = curPos; 
    console.log("x is curPos "+ x);
    console.log("n is " + n);
    while (x < n) {
        console.log("value at " + x+ " is " + lst[x]);
              delete lst[x];
              console.log("value at " + x+ " is now " + lst[x]+ "\n");
    x += curPos; 
    }
    console.log("current pos is : "+ curPos);
            return curPos;
          }
    }

    var next = mystery(25);
next();
    console.log("again");
    next();
    console.log("again2");
    next();
