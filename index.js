const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const mysql = require("mysql");
app.use(bodyParser.json());       

const conn = mysql.createConnection({
	host: "localhost",
	user: "root",
	password: "root",
	database: "employee"
});
conn.connect((err)=>{
    if(err)throw err;
    console.log("mysql is connected successfully!")
})


app.get("/api/view", (req, res) => {
	let sql = "select * from  Employee";
	let query = conn.query(sql, (err, result) => {
		if (err) throw err;
		res.send(JSON.stringify({ response: result }));
	});
});

app.get("/api/view/:id", (req, res) => {
	let sql = "SELECT * FROM  Employee WHERE id =" + req.params.id ;
	let query = conn.query(sql, (err, result) => {
		if (err) throw err;
		res.send(JSON.stringify({response: result }));
	});
}); 

app.post("/api/create", (req, res) => {
	let data = {id:req.body.id, name: req.body.name, age: req.body.age };
    console.log(req.body.name+" "+  req.body.age);
	let sql = "INSERT INTO Employee SET ?";
	let query = conn.query(sql, data, (err, result) => {
		if (err) throw err;
		res.send(JSON.stringify({ response: "New Record is Added successfully" }));
	});
});

app.delete("/api/delete/:id", (req, res) => {
	let sql = "DELETE FROM Employee WHERE id=" + req.params.id + "";
	let query = conn.query(sql, (err, result) => {
		if (err) throw err;
		res.send(JSON.stringify({ status: 200, response: "Record deleted successfully" }));
	});
});

app.put("/api/update/", (req, res) => {
	let sql = "UPDATE Employee SET name='" + req.body.name + "', age='" + req.body.age + "' WHERE id=" + req.body.id;
	let query = conn.query(sql, (err, result) => {
		if (err) throw err;
		res.send(JSON.stringify({ status: 200, response: "Record updated SuccessFully" }));
	});
});

app.listen(8000, () => {
	console.log("server started on port 8000...");
});
