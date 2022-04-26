const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

const fileupload = require("express-fileupload");

const host = "localhost";
const username = "root";
const passwd = "";
const db = "asztalfoglalas";

module.exports = function(app) {
  app.use(function(req, res, next) {
    res.header(
      "Access-Control-Allow-Headers",
      "x-access-token, Origin, Content-Type, Accept"
    );
    next();
  });

  app.get('/etterem', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT * from etterem', function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.post('/etterem_torles', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
    connection.connect()
    connection.query('DELETE FROM etterem WHERE etterem.id='+req.body.bevitel1, function (err, rows, fields) {
      if (err) throw err
      //console.log("Szavazatát rögzítettük!")
      res.send("Sikeres törlés!")
    })
    connection.end()
  })

  app.post('/ellenorzes', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT foglalas.foglalas_id, asztalok.asztal_megnevezes, asztalok.fo, foglalas.asztalok_id, datum, ora, foglalt FROM foglalas INNER JOIN asztalok ON foglalas.asztalok_id=asztalok.asztalok_id WHERE foglalas.etterem_id = ? AND foglalas.datum = ? AND foglalas.ora BETWEEN "'+req.body.bevitel3+':00:00" AND "'+req.body.bevitel3+':59:00" AND foglalas.foglalt = "0"',
      [
      req.body.bevitel1,
      req.body.bevitel2
      ], function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })
  
  app.post('/foglalas', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('UPDATE asztalfoglalas.foglalas SET datum=?, ora="'+req.body.bevitel3+':00:00", nev=?, telefon=?, foglalt="1" WHERE foglalas_id=?',
      [
      req.body.bevitel2,
      req.body.bevitel4,
      req.body.bevitel5,
      req.body.bevitel1
      ], function (err, rows, fields) {
      if (err) throw err
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.post('/etlap_felvitel', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
  
    connection.connect()
  
    connection.query('INSERT INTO asztalfoglalas.etlapok (etterem_id, nev, tipus_id, ar) VALUES (?, ?, ?, ?);',
    [
      req.body.bevitel1,
      req.body.bevitel2,
      req.body.bevitel3,
      req.body.bevitel4
    ], 
    function (err, rows, fields) {
      if (err) throw err
        res.send(rows)
        console.log(rows)
    })
  
    connection.end()
  })

  app.get('/etterem2', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,ertekeles2.db,ertekeles2.db2,velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles2 INNER JOIN etterem ON etterem.id=ertekeles2.etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.post('/like', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
    
    connection.connect()
  
    connection.query("UPDATE `ertekeles2` SET `db`= ertekeles2.db+1 WHERE ertekeles2.etterem_id='"+req.body.bevitel1+"'", function (err, rows, fields) {
      if (err) throw err
        
      res.send(rows)
      console.log(rows)
    })
    connection.end()
  })
  
  app.post('/dislike', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
  
    connection.connect()
  
    connection.query("UPDATE `ertekeles2` SET `db2`= ertekeles2.db2+1 WHERE ertekeles2.etterem_id='"+req.body.bevitel1+"'", function (err, rows, fields) {
      if (err) throw err
      
      res.send(rows)
      console.log(rows)
    })
    connection.end()
  })

  app.get('/velemenyek2', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT * FROM velemenyek ', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.get('/rendezveny', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT rendezveny.rendezveny_id, rendezveny.etterem_id,rendezveny.felhasznalo,rendezveny.telefon,rendezveny.email,rendezveny.idopont,rendezveny.foglalt,etterem.nev FROM rendezveny INNER JOIN etterem on rendezveny.etterem_id=etterem.id ORDER BY rendezveny.idopont DESC', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })
 

  app.post('/rendezveny2', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    
    connection.connect()
    let sz='SELECT count(idopont) AS"db" FROM `rendezveny` WHERE idopont="'+req.body.bevitel1+'" AND etterem_id='+req.body.bevitel2+''   
    connection.query(sz, function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })

  app.get('/ertekelesdb', (req, res) => {
    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
      
    connection.connect()
      
    connection.query('SELECT * FROM ertekeles2', function (err, rows, fields) {
      if (err) throw err
      
      console.log(rows)
      res.send(rows)
    })
    connection.end()
  })


  app.post('/velemenyek', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
  
    connection.connect()
  
    connection.query("SELECT * FROM velemenyek WHERE Etteremid="+req.body.bevitel1, function (err, rows, fields) {
      if (err) throw err
        res.send(rows)
        console.log("sikerült")
    })
  
    connection.end()
  })
  
  app.post('/szemelykereso', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
  
    connection.connect()
    let sz='SELECT rendezveny.etterem_id,rendezveny.felhasznalo,rendezveny.telefon,rendezveny.email,rendezveny.idopont,rendezveny.foglalt,etterem.nev FROM rendezveny INNER JOIN etterem on rendezveny.etterem_id=etterem.id WHERE rendezveny.felhasznalo Like "%'+req.body.bevitel1+'%" ORDER BY rendezveny.idopont DESC';
    connection.query(sz, function (err, rows, fields) {
      if (err) throw err
        res.send(rows)
        console.log(rows)
    })
  
    connection.end()
  })

  app.post('/datumkereso', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
      acquireTimeout: 1000000
    })
  
    connection.connect()
    let sz='SELECT rendezveny.etterem_id,rendezveny.felhasznalo,rendezveny.telefon,rendezveny.email,rendezveny.idopont,rendezveny.foglalt,etterem.nev FROM rendezveny INNER JOIN etterem on rendezveny.etterem_id=etterem.id WHERE rendezveny.idopont="'+req.body.bevitel1+'" ORDER BY rendezveny.idopont DESC';
    console.log(sz);
    connection.query(sz, function (err, rows, fields) {
      if (err) throw err
        res.send(rows)
        console.log(rows)
    })
  
    connection.end()
  })

  app.post('/ert_felvi', (req, res) => {

    var mysql = require('mysql')
    var connection = mysql.createConnection({
      host: host,
      user: username,
      password: passwd,
      database: db,
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
    host: host,
    user: username,
    password: passwd,
    database: db,
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
    host: host,
    user: username,
    password: passwd,
    database: db,
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
app.post('/rendezvenytorles', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
    host: host,
    user: username,
    password: passwd,
    database: db,
    acquireTimeout: 1000000
  })

  connection.connect()

  connection.query("DELETE FROM rendezveny WHERE rendezveny_id='"+req.body.bevitel1+"'", function (err, rows, fields) {
    if (err) throw err
      res.send(rows)
      console.log(rows)
  })

  connection.end()
})
app.post('/torol2', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
    host: host,
    user: username,
    password: passwd,
    database: db,
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
    host: host,
    user: username,
    password: passwd,
    database: db,
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
    host: host,
    user: username,
    password: passwd,
    database: db,
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
    host: host,
    user: username,
    password: passwd,
    database: db,
    acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,ertekeles2.db,ertekeles2.db2,velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles2 INNER JOIN etterem ON etterem.id=ertekeles2.etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id ORDER BY etterem.nev', function (err, rows, fields) {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
  })
  connection.end()
})

app.get('/etterem_abc_csok', (req, res) => {
  var mysql = require('mysql')
  var connection = mysql.createConnection({
    host: host,
    user: username,
    password: passwd,
    database: db,
    acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,ertekeles2.db,ertekeles2.db2,velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles2 INNER JOIN etterem ON etterem.id=ertekeles2.etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id ORDER BY etterem.nev DESC', function (err, rows, fields) {
    if (err) throw err
    
    console.log(rows)
    res.send(rows)
  })
  connection.end()
})

app.get('/ert_rend', (req, res) => {
  var mysql = require('mysql')
  var connection = mysql.createConnection({
    host: host,
    user: username,
    password: passwd,
    database: db,
    acquireTimeout: 1000000
  })
    
  connection.connect()
    
  connection.query('SELECT etterem.id,etterem.nev,etterem.lakcim,etterem.telefon,etterem.nyitas,etterem.kep,ertekeles2.db,ertekeles2.db2,velemenyek.velemeny_nev,velemenyek.velemeny FROM ertekeles2 INNER JOIN etterem ON etterem.id=ertekeles2.etterem_id LEFT JOIN velemenyek ON velemenyek.Etteremid=etterem.id GROUP BY etterem.id ORDER BY ertekeles2.db DESC', function (err, rows, fields) {
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
      host: host,
      user: username,
      password: passwd,
      database: db,
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

app.post('/rendezvenyfeltoltes', (req, res) => {

  var mysql = require('mysql')
  var connection = mysql.createConnection({
    host: host,
    user: username,
    password: passwd,
    database: db,
    acquireTimeout: 1000000
  })

  connection.connect()
  
  
  connection.query("INSERT INTO rendezveny VALUES (NULL,'"+req.body.bevitel1+"','"+req.body.bevitel2+"','"+req.body.bevitel3+"','"+req.body.bevitel4+"','"+req.body.bevitel5+"',1)", function (err, rows, fields) {
   if (err) throw err
    res.send(rows)
    
  })

  connection.end()
})
  
};
