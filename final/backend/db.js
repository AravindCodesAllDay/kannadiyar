const Pool = require('pg').Pool;
const pool = new Pool ({
    user: "postgres",
    password: "Gowtham1403",
    database: "kannadiyar",
    port : 5432,
    host: "localhost"
});

module.exports = pool;