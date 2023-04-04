const mysql = require('mysql');

const con = mysql.createConnection({
    connectionLimit : 10,
    // connectTimeout  : 60 * 60 * 1000,
    // acquireTimeout  : 60 * 60 * 1000,
    // timeout         : 60 * 60 * 1000, 
    host: "localhost",
    user: "root",
    password: null,
    database: "dishadvisor",
});

con.connect((err) => {
    if(err) throw err;
    console.log("Connection Created!");
})

module.exports.con = con;