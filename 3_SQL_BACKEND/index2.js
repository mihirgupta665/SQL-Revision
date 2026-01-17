const express = require("express");
const app = express();
const mysql = require("mysql2");
const { faker } = require("@faker-js/faker");
const path = require("path");
const methodOverride = require("method-override");

app.use(methodOverride("_method"));
app.use(express.urlencoded({extended : true}));

const connection = mysql.createConnection({
    host : "localhost",
    user : "root",
    database : "delta_app",
    password : "M@ihir123"
});

const getRandomUser = () =>{
    return [
        faker.string.uuid,
        faker.internet.username,
        faker.internet.email,
        faker.internet.password
    ];
}

let data = []
for(let i=0; i<100; i++){
    data.push(getRandomUser());
}

app.set("view engine", "ejs");
app.set("views", path.join( __dirname, "/views" ));

app.get("/", (req, res)=>{
    let q = "SELECT count(*) FROM user";
    try{
        connection.query(q, (error, result) =>{
            if(error) throw error;
            // res.send(result);
            let count = result[0]["count(*)"];
            res.render("home.ejs", {count});     

        });
    }
    catch{
        res.send("Error occured in DB");
    }

});

app.get("/users", (req, res)=>{
    let q = "Select * FROM user"
    try{
        connection.query(q, (error, result)=>{
            if(error) throw error;
            // console.log(result);
            // res.send(result);
            res.render("showusers.ejs", {result});
        });
    }
    catch(error){
        console.log("Error in database");
        res.send("Error in the database");
    }
})

app.get("/users/:id/edit", (req, res)=>{
    let { id } = req.params;
    let q = `SELECT * FROM user WHERE id='${id}'`;
    try{

        connection.query(q, (error, result)=>{
            if(error) throw error;
            let user = result[0];
            res.render("edit.ejs", {user});
        });
    }
    catch(error){
        res.send("Error in DATABASE!");
    }
});

app.patch("/users/:id", (req,res) => {
    let {id} = req.params;
    let {password : formpass, username : newusername} = req.body;
    // whenever we run a query and we have used a placeholder variable then we need to add inverted comma to make it a string instead if just a value.
    let q = `SELECT * FROM user WHERE id='${id}'`;
    try{
        connection.query(q, (error, result)=>{  
            if(error) throw error;
            let user = result[0];
            // console.log(result[0]);
            if(user.password != formpass){
                res.send("WRONG PASSWORD!!!");
            }
            else{
                let q2 = `UPDATE user SET username='${newusername}' WHERE id='${id}'`;
                connection.query(q2, (error, result)=>{
                    if(error) throw error;
                    res.redirect("/users");
                });
            }
        });
    }
    catch(error){
        res.send("Error in the database.");
    }

});

app.listen("8080", ()=>{
    console.log("server listening through the port 8080");
});