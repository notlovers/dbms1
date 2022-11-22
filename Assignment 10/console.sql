// Create data base
db;
use Collage;
db;

// Create collection
db.createCollection("stud");

// Drop collection
db.stud.drop();

// insert data operation
db.stud.insertOne({roll: 1, name: "Raj", age: 22});
db.stud.insertOne({roll: 2, name: "Sagar", age: 20});
db.stud.insertOne({roll: 3, name: "Ajay", age: 19});
db.stud.insertOne({roll: 4, name: "Manoj", age: 18});
db.stud.insertOne({roll: 5, name: "Pavan", age: 25});
db.stud.insertOne({roll: 6, name: "Nilesh", age: 20});
db.stud.insertOne({roll: 7, name: "Kiran", age: 23});
db.stud.insertOne({roll: 8, name: "Abhi", age: 24});
db.stud.insertOne({roll: 9, name: "Madhav", age: 18});
db.stud.insertOne({roll: 10, name: "Sunil", age: 17});

// Display data
db.stud.find();

//  RDBMS Where Clause Equivalents in MongoDB ($gt, $gte, $lt , $lte, $ne, $in, $nin )
db.stud.find({"roll" : 2});
db.stud.find({"age" : {"$lt":20}});
db.stud.find({"age" : {"$in" : [17, 22, 25]}});
db.stud.find({"age" : {"$gt" : 20, "$lt" :25}});

// Like Operator
db.stud.find({name:/^A/}).pretty();
db.stud.find({name:/a/}).pretty();

// Logical Operator ($or, $and, $not, $nor ) AND Operator ($and)
db.stud.find ({"$and": [{roll:3}, {name: "Ajay"}] }).pretty();
db.stud.find ({ name: { $not: /^A/}});

// Update Data : update(); ( and Insert Data using :- save();)
db.stud.save({roll:11, name:"Rajesh", age:21});
db.stud.updateOne({roll:11},{$set:{name:"Anil"}});

// Delete Data : remove();
db.stud.remove({"roll":11});