const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

const fileupload = require("express-fileupload");

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.get('/etterem2', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
    host: 's1.siralycore.hu',
    user: 'asztalfoglalas',
    password: 'istván',
    database: 'asztalfoglalas',
    acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,AVG(ertekeles.ert) AS "atlag",velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles RIGHT JOIN etterem ON etterem.id=ertekeles.Etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })


  app.get('/ertekelesdb', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
    host: 's1.siralycore.hu',
    user: 'asztalfoglalas',
    password: 'istván',
    database: 'asztalfoglalas',
    acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT ertekeles.Etterem_id,etterem.nev,(Count(ertekeles.ert)) AS db , AVG(ertekeles.ert) AS atlag FROM ertekeles INNER JOIN etterem ON etterem.id=ertekeles.Etterem_id GROUP BY ertekeles.Etterem_id ', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })


  app.get('/velemenyek', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
    host: 's1.siralycore.hu',
    user: 'asztalfoglalas',
    password: 'istván',
    database: 'asztalfoglalas',
    acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT * FROM velemenyek', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.post('/ert_felvi', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
    host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
    })

    connection.connect()
    

    connection.query("INSERT INTO ertekeles (ert_id, Etterem_id, ert) VALUES (NULL, '"+req.body.bevitel1+"', '"+req.body.bevitel2+"')", function (err, rows, fields) {
     if (err) throw err
      res.send(rows)
      console.log(rows)
    })

    connection.end()
})


app.post('/vfelvi', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
user: 'asztalfoglalas',
password: 'istván',
database: 'asztalfoglalas',
acquireTimeout: 1000000
  })

  connection.connect()
  

  connection.query("INSERT INTO velemenyek (velemenyid,Etteremid,velemeny_nev,velemeny) VALUES (NULL, '"+req.body.bevitel1+"', '"+req.body.bevitel2+"', '"+req.body.bevitel3+"')", function (err, rows, fields) {
   if (err) throw err
    res.send(rows)
    console.log(rows)
  })

  connection.end()
})

app.post('/torol', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })

  connection.connect()

  connection.query("DELETE FROM etterem WHERE id=('"+req.body.bevitel1+"')", function (err, rows, fields) {
    if (err) throw err
      res.send("sikerült")
      console.log("sikerült")
  })

  connection.end()
})

app.post('/torol2', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })

  connection.connect()

  connection.query("DELETE FROM velemenyek WHERE velemenyid=('"+req.body.bevitel1+"')", function (err, rows, fields) {
    if (err) throw err
      res.send("sikerült")
      console.log("sikerült")
  })

  connection.end()
})


app.post('/kereses', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })

  connection.connect()

  let sz='SELECT * from velemenyek WHERE velemenyek.velemeny like "%'+req.body.bevitel1+'%"';
  console.log(sz);
  connection.query(sz, function (err, rows, fields) {
    if (err) throw err
      res.send(rows)
      console.log(rows)
  })

  connection.end()
})


app.post('/kereses2', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })

  connection.connect()

  let sz='SELECT * from etterem WHERE etterem.nev like "%'+req.body.bevitel1+'%"';
  console.log(sz);
  connection.query(sz, function (err, rows, fields) {
    if (err) throw err
      res.send(rows)
      console.log(rows)
  })

  connection.end()
})
  
app.get('/etterem_abc_rend', (req, res) => {
  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,AVG(ertekeles.ert) AS "atlag",velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles RIGHT JOIN etterem ON etterem.id=ertekeles.Etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id ORDER BY etterem.nev', function (err, rows, fields) {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
  })
  connection.end()
})

app.get('/etterem_abc_csok', (req, res) => {
  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,AVG(ertekeles.ert) AS "atlag",velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles RIGHT JOIN etterem ON etterem.id=ertekeles.Etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id  ORDER BY etterem.nev DESC', function (err, rows, fields) {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
  })
  connection.end()
})

app.get('/ert_rend', (req, res) => {
  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,AVG(ertekeles.ert) AS "atlag",velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles RIGHT JOIN etterem ON etterem.id=ertekeles.Etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id  ORDER BY atlag DESC', function (err, rows, fields) {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
  })
  connection.end()
})


app.use(fileupload());
  app.post("/upload", (req, res) => {
    const newpath = "./kepek/";
    const file = req.files.file;
    const filename = file.name;
  
    file.mv(`${newpath}${filename}`, (err) => {
      if (err) {
        return res.status(500).send({ message: "File upload failed", code: 200 });
      }
        return res.status(200).send({ message: "File Uploaded", code: 200 });
    });
  });

  app.post('/etterem_felvi', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
    host: 's1.siralycore.hu',
  user: 'asztalfoglalas',
  password: 'istván',
  database: 'asztalfoglalas',
  acquireTimeout: 1000000
    })

    connection.connect()
    

    connection.query("INSERT INTO etterem VALUES (NULL,'"+req.body.bevitel1+"','"+req.body.bevitel2+"','"+req.body.bevitel3+"','"+req.body.bevitel4+"','"+req.body.bevitel5+"')", function (err, rows, fields) {
     if (err) throw err
      res.send("sikerült")
      console.log("sikerült")
    })

    connection.end()
})

app.post('/rendezveny', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
  host: 's1.siralycore.hu',
user: 'asztalfoglalas',
password: 'istván',
database: 'asztalfoglalas',
acquireTimeout: 1000000
  })

  connection.connect()
  
  
  connection.query("INSERT INTO rendezveny VALUES (NULL,4,'"+req.body.bevitel1+"','"+req.body.bevitel2+"','"+req.body.bevitel3+"','"+req.body.bevitel4+"',0)", function (err, rows, fields) {
   if (err) throw err
    res.send("sikerült")
    console.log("sikerült")
  })

  connection.end()
})
  
};
