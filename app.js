var express = require('express');
var bodyParser = require("body-parser");
var app = express();

app.set("view engine", "ejs");
app.use(bodyParser.urlencoded({extended:true}));

app.get('/', function(req, res) {
  res.render("index");
});

app.listen(process.env.PORT || 3000, function() {
  console.log("SERVER STARTED");
})