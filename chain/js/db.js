const HOST = '192.168.109.80';
const USER = 'root';
const PASSWORD = 'forward098';
const DATABASE = 'waapi';
const TABLE = 'Users';
const mysql = require('mysql2/promise');

let result;

function getSQLResult() {
  return new Promise(async (resolve, reject) => {
    try {
      const singleStoreConnection = mysql.createPool({
        host: HOST,
        user: USER,
        password: PASSWORD,
        database: DATABASE,
      });
     
      const [rows] = await singleStoreConnection.execute(
        "SELECT * FROM Users LIMIT 3"
      );
  
      result = JSON.stringify(rows)
      
      resolve();
    } catch (e) {
      console.error(e);
      return reject(e);
    }
  });
}

async function main() {
    await getSQLResult();
}

await main();

return result;
