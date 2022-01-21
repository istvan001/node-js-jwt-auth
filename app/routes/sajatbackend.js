const { authJwt } = require("../middleware");
const controller = require("../controllers/user.controller");

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
  
};
