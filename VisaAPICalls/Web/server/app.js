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
      "logged" : true
  });
});

app.get('/authentication', function (req, res) {
  res.json({
      "id" : "1232",
      "username" : "Fulano",
      "email" : "fulano@gmail.com",
      "logged" : true
  });
});

app.get('/transaction', function (req, res) {
  res.json({
      "id" : "23412412",
      "merchantName" : "Teste",
      "amount" : 10,
      "itens" : [
          {
              "id" : "23423",
              "sku" : "12421",
              "title" : "Item1",
              "amount" : 5
          }, {
              "id" : "234223",
              "sku" : "124321",
              "title" : "Item2",
              "amount" : 5
          }
      ]
  });
});