const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");
const client = require("prom-client");

const app = express();
app.use(express.json());
app.use(cors());

/* 🔹 Prometheus Metrics Setup */
const collectDefaultMetrics = client.collectDefaultMetrics;
collectDefaultMetrics();

/* Custom metric (optional but good practice) */
const httpRequestCounter = new client.Counter({
  name: "http_requests_total",
  help: "Total number of HTTP requests",
  labelNames: ["method", "route", "status"]
});

/* Middleware to count requests */
app.use((req, res, next) => {
  res.on("finish", () => {
    httpRequestCounter.inc({
      method: req.method,
      route: req.route?.path || req.path,
      status: res.statusCode
    });
  });
  next();
});

let db;

/* 🔹 MySQL Connection with Retry */
function connectDB() {
  const connection = mysql.createConnection({
    host: "mysql",
    user: "root",
    password: "root",
    database: "appdb"
  });

  connection.connect(err => {
    if (err) {
      console.log("Database not ready... retrying in 5 seconds");
      setTimeout(connectDB, 5000);
    } else {
      console.log("Connected to MySQL");
      db = connection;
    }
  });
}

connectDB();

/* 🔹 Routes */

app.post("/add", (req, res) => {
  const name = req.body.name;

  db.query(
    "INSERT INTO users (name) VALUES (?)",
    [name],
    (err) => {
      if (err) {
        console.log(err);
        res.status(500).send("Database error");
      } else {
        res.send("User Added");
      }
    }
  );
});

app.get("/users", (req, res) => {
  db.query("SELECT * FROM users", (err, result) => {
    if (err) {
      console.log(err);
      res.status(500).send("Database error");
    } else {
      res.json(result);
    }
  });
});

app.delete("/delete/:id", (req, res) => {
  const id = req.params.id;

  db.query(
    "DELETE FROM users WHERE id=?",
    [id],
    (err) => {
      if (err) {
        console.log(err);
        res.status(500).send("Database error");
      } else {
        res.send("User Deleted");
      }
    }
  );
});

/* 🔹 Metrics Endpoint */
app.get("/metrics", async (req, res) => {
  res.set("Content-Type", client.register.contentType);
  res.end(await client.register.metrics());
});

/* 🔹 Start Server */
app.listen(5000, () => {
  console.log("Backend running on port 5000");
});

/* 🔹 Health Check Endpoint */
app.get("/", (req, res) => {
  res.status(200).send("OK");
});