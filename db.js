// db.js
const mysql = require("mysql");

// Database configurations for all branches
const dbConfigs = {
  condet: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_condet",
    connectionLimit: 10
  },
  karawaci: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_karawaci",
    connectionLimit: 10
  },
  bsd: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_bsd",
    connectionLimit: 10
  },
  bandungkota: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_bandungkota",
    connectionLimit: 10
  },
  bandungbuahbatu: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_bandungbuahbatu",
    connectionLimit: 10
  },
  pagesangan: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_pagesangan",
    connectionLimit: 10
  },
  ampel: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_ampel",
    connectionLimit: 10
  },
  sidoarjo: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_sidoarjo",
    connectionLimit: 10
  },
  bintaro: {
    host: "localhost",
    user: "root",
    password: "",
    database: "bosgil_bintaro",
    connectionLimit: 10
  }
};

// Create connection pools for all databases
const pools = {};

// Initialize connection pools and test connections
Object.entries(dbConfigs).forEach(([branch, config]) => {
  pools[branch] = mysql.createPool(config);
  
  // Test connection
  pools[branch].getConnection((err, connection) => {
    if (err) {
      console.error(`Error connecting to ${config.database} database:`, err);
      return;
    }
    console.log(`Connected to ${config.database} database!`);
    connection.release();
  });
});

// Function to get pool for a specific branch
const getPool = (branch) => {
  if (!pools[branch]) {
    throw new Error(`Database connection for branch ${branch} not found`);
  }
  return pools[branch];
};

module.exports = {
  getPool,
  pools,
  dbConfigs // Export dbConfigs so it can be used in server.js
};
