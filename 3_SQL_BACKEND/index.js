// install the npm package @faker-js/faker
const { faker } = require('@faker-js/faker');
const mysql = require('mysql2');

// there are four ways to connect with sql: 
// i> directly from sql workbecnch ii> mysql.createConnection, iii> cli command, iv> source schema.sql : file 
// mysql has a function named createConnection for creating a connection with the database to node
// the createConnection takes a object as paramegter and that object has many porperities like => 
// properties of the object are : host = 'localhost', user = 'root', database: 'test', password: 'mysql@123'
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    database: 'delta_app',
    password: 'M@ihir123'
});

try {
    // connection has a method query which takes 2 paramter one is the SQL command and second is the call back function .
    // the call back function has 3 parameters too these are: (error, result, fields)
    let q = "SHOW TABLES"
    connection.query(q, (err, res) => {
        if (err) throw err;
        console.log(res);
        // console.log(res.length);
        // console.log(res[0]);
        // console.log(res[1]);
    });
}
catch (err) {
    console.log("Error : " + err);
}


// let getRandomUser = () => {
//   return {
//     id: faker.string.uuid(),    // generates random uids... 
//     username: faker.internet.username(),
//     email: faker.internet.email(),
//     password: faker.internet.password(),
//   };
// }
// console.log(getRandomUser()); 

// mysql2  : is the package used to connect node to sql and is only imported as it has more atheication security 

// INSERTING DATA into DATABASE's TABLES :->  ? is place holder whose value could be replaced by the corresponding array element passed in edjacent to the query.

let getRandomUser = () => {     // created a named arrow function
    return [
        faker.string.uuid(),
        faker.internet.username(),
        faker.internet.email(),
        faker.internet.password()
    ];
}

let q2 = "INSERT INTO user (id, username, email, password) VALUES ?"        // ? is a placeholder and array will replace this placeholder
let data = [];    // creating a array of array for containing 100 fake users data
for(let i=0; i<100; i++){
    data.push(getRandomUser());         // creating one one distinct user 100 times the pushing it to array
}

/*
let users = [
    [123, "Mihir Gupta", "mihirgupta665@gmail.com", 167236],
    [124, "Vaishali Patel", "vaishali665@gmail.com", 213213],
    [125, "Divyansh Goyal", "divyansh665@gmail.com", 231122]
];
*/
try{
    // all the data array od arrays of information of user need to be separtely added in database , which means each user need to be a treated seperately for addition in the table
    connection.query(q2, [data] , (err, res)=>{    // when mutpliple values are passed then square brackets indicates that each row should be passed fpr each element.
        if(err) throw err;
        console.log(res);
        
    });
}
catch(err){
    console.log("Error : "+err);
}


// connection remains on when once stablished
connection.end();       // thus with this line connection gets ended