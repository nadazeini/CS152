
let changeHandler = {    has: function(t, p) {
    console.log(t.constructor.name + " has " + p);
    return p in t;    },
    get: function(t, p, r) {
    console.log(t.constructor.name + " gets " + p);
    return Reflect.get(...arguments);    },
    deleteProperty: function(t, p)
    {console.log("Deleted " + p + " in " + t.constructor.name);
    return delete t[p];},    set: function(t, p, v, r) {
    console.log("Set " + t.constructor.name + " " + p + " to " + v);
    t[p] = v;        return true;    },
    apply: function(target, arg, argumentsList) {
    console.log(target.constructor.name + " applied " + arg + " with list" + argumentsList);
    return target.apply(arg, argumentsList);    },
    getOwnPropertyDescriptor: function(t, p) {
    console.log(t.constructor.name + " property descriptor for " + p);
    return Object.getOwnPropertyDescriptor(t, p);    },
    construct: function(target, argumentsList, newTarget)
    { tconsole.log(" Constructing " + t.constructor.name);
    return new target(...args);},    getPrototypeOf: function(t)
    {        console.log(" Prototype of " + t.constructor.name);
    return Object.getPrototypeOf(t);    },
    setPrototypeOf: function(t, p) {
    console.log("Prototype of " + t.constructor.name + " to " + p.constructor.name);
    return Reflect.setPrototypeOf(t, p);    },
    preventExtensions: function(t) {
    console.log(t.constructor.name + " prevent extensions");
    return Object.preventExtensions(t);    },
    defineProperty: function(t, k, d) {
    console.log( k + " for " + t.constructor.name + " to " + d);
    return true;    },
    isExtensible: function(t) {console.log(t.constructor.name + " is extensible ");
    return Reflect.isExtensible(t);},
    ownKeys: function(t) {        console.log( t.constructor.name + " own keys");
    return Reflect.ownKeys(t);    }}