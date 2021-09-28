var express = require('express');
var exphbs  = require('express-handlebars');
var app = express();
var os = require('os');
var moment = require('moment');

app.engine('handlebars', exphbs({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');
app.use(express.static('static'));

var port = process.env.PORT || 41005;
var message = process.env.MESSAGE || "This lab allows you to experiment with containerizing a NodeJS app";

app.get('/', function (req, res) {
    res.render('home', {
      message: message,
      hostName: os.hostname(),
      executionDate: moment().format('MM-DD-YYYY'),
      port: port
    });
});

app.listen(port, function () {
  console.log("Listening on: http://%s:%s", os.hostname(), port);
});
