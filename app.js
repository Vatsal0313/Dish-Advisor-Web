const express = require('express');
const app = express();
const fs = require('fs');
app.set('view engine', 'ejs');

const hostname = '127.0.0.1';
const port = 3000;
const mysql = require("./routes/connection").con
const responsedelay = 50;   // miliseconds
const bodyParser = require("body-parser");
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

const path = require('path');
const router = express.Router();

app.set('views', path.join(__dirname, 'views'));

app.get("/", (req, res) => {
  res.render("home");
});

app.get("/h2",(req,res)=>{
  res.render("home_2")
})

app.post("/getdish", (req, res) => {
  let org = req.body.origin;
  let i1 = req.body.i1;
  let i2 = req.body.i2;

  var filter = [org, i1, i2, i1, i2, i1, i2, i1, i2];

  mysql.query('SELECT * FROM origin JOIN bigdata ON origin.dish_name=bigdata.dish_name WHERE origin.origin_name=? AND (bigdata.ing1=? OR bigdata.ing1=? OR bigdata.ing2=? OR bigdata.ing2=? OR bigdata.ing3=? OR bigdata.ing3=? OR bigdata.ing4=? OR bigdata.ing4=?);', filter, async (err, result) => {
    if (err) throw err
    else {
      // res.send(results);
      console.log("RESULTS:",result);
      res.render("home_2",{ data: result, org: org, i1: i1,i2: i2});
    }
  })
})

app.listen(port, function () {
  console.log(`Server is started on port: http://${hostname}:${port}/`);
});