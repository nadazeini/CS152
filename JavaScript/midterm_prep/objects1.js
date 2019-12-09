var complex = { real: 3, imaginary: 1 };
console.log (complex);
var Dog_prototype = {
    speak: function() { console.log('bark!'); }
  };
var rex = { name: 'Rex', __proto__: Dog_prototype } // Manually setting the prototype chain -- not universal
rex.speak();
// We can add or remove properties at runtime
rex['favoriteToy'] = 'squeaky ball'; // could write this as rex.favoriteToy
console.log(rex);
//delete rex.name;
// We can override properties if we wish
rex.speak = function() { console.log('grr....'); }
rex.speak();
// Or delete them, with perhaps surprising results
delete rex.speak;
rex.speak();