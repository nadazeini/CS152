let fs = require('fs');
let p = new Promise((resolve, reject) => {
//{ key: 'hello' }
let f = fs.readFileSync('test.json'); resolve(f);
});
p.then(JSON.parse)
.then((res) => res.key,
    (err) => console.error(err))
.then((res) => console.log(res + " world!"));