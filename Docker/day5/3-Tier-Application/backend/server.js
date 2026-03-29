const express = require("express");
const mysql = require("mysql2");
const cors = require("cors");

const app = express();
app.use(express.json());
app.use(cors());

let db;

/* Function to connect to MySQL with retry */

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

/* Insert user */

app.post("/add", (req, res) => {

  const name = req.body.name;

  db.query(
    "INSERT INTO users (name) VALUES (?)",
    [name],
    (err, result) => {

      if (err) {
        console.log(err);
        res.status(500).send("Database error");
      } else {
        res.send("User Added");
      }

    }
  );

});

/* Fetch users */

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

/* Delete user */

app.delete("/delete/:id", (req, res) => {

  const id = req.params.id;

  db.query(
    "DELETE FROM users WHERE id=?",
    [id],
    (err, result) => {

      if (err) {
        console.log(err);
        res.status(500).send("Database error");
      } else {
        res.send("User Deleted");
      }

    }
  );

});

app.listen(5000, () => {
  console.log("Backend running on port 5000");
});
