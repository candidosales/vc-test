var express = require('express');
var app = express();

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});

app.get('/', function (req, res) {
  res.send('Hello World!');
});

app.get('/register', function (req, res) {
  res.json({
      "id" : "1232",
      "username" : "Fulano",
      "email" : "fulano@gmail.com",
      "cpf" : "00673744337",
      "logged" : true
  });
});

app.get('/authentication', function (req, res) {
  res.json({
      "id" : "1232",
      "username" : "Fulano",
      "email" : "fulano@gmail.com",
      "cpf" : "00673744337",
      "logged" : true
  });
});

app.get('/transaction', function (req, res) {
  res.json({
      "id" : "1111",
      "merchantName" : "Teste",
      "callid" : "3346233718708050201",
      "amount" : 10,
      "status" : "VERIFIED",
      "itens" : [
          {
              "id" : "111",
              "sku" : "123",
              "title" : "Item1",
              "amount" : 5
          }, {
              "id" : "222",
              "sku" : "321",
              "title" : "Item2",
              "amount" : 5
          }
      ]
  }, {
      "id" : "2222",
      "merchantName" : "Teste",
      "callid" : "3346233718708050222",
      "amount" : 5,
      "status" : "PENDING",
      "itens" : [
          {
              "id" : "333",
              "sku" : "112",
              "title" : "Item3",
              "amount" : 5
          }
      ]
  });
});