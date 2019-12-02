var net = require('net');
var eol = require('os').EOL;

var srvr = net.createServer();
var clientList = [];
var list = "\\list";
var rename = "\\rename";
var private = "\\private";
srvr.on('connection', function (client) {
  client.name = client.remoteAddress + ':' + client.remotePort;
  client.write('Welcome, ' + client.name + eol);
  clientList.push(client);

  client.on('data', function (data) {
    broadcast(data, client);
  });

});

function broadcast(data, client) {
  //Typing '\list' will list the names of all other users.
  data += '';
  var strData = data;
  strData = strData.slice(0, strData.indexOf(eol));
  var fields = ('' + strData).split(' ');
  if (fields[0] == list) {
    client.write("List of users is: ");
    for (let j of clientList)
      if (j !== client)
        client.write(j.name + " ");
  }
  // Typing '\rename <newname>' will let the user 
  //specify a new name for himself/herself.
  else if ((fields[0] == rename) && (fields[1].length > 0)) {
    client.name = fields[1];
    clientList.indexOf(fields[1]);
    for (var i in clientList) {
      if (client !== clientList[i]) {
        clientList[i].write("");
      }
    }
  }
  //Typing '\private <name> <msg>' will 
  //send a message only to the specified user.
  else if ((fields[0] == private) && (fields[1].length > 0)) {
    strData = strData.substring(strData.indexOf(fields[2]));
    if (strData.length > 0) {

      for (let i of clientList)
        if (i.name == fields[1]) {
          i.write(client.name + " says privately " + strData);
        }
    }
  }
  else
    for (var i in clientList) {
      if (client !== clientList[i]) {
        clientList[i].write(client.name + " says " + data);
      }
    }
}
srvr.listen(9000);

