const express = require('express')
const mongoose = require('mongoose')
var app = express()
var data = require("./noteSchema")

mongoose.connect("mongodb://localhost/myDB")
mongoose.set('useNewUrlParser', true);
mongoose.set('useFindAndModify', false);
mongoose.set('useCreateIndex', true);
mongoose.set('useUnifiedTopology', true);

mongoose.connection.once("open", function(){
    console.log("Connected to DB!")
}).on("error", function(error){
    console.log("Failed to connect " + error)
})

// CREATE A NOTE
// POST request
var server = app.listen(8081, "192.168.80.241", () => {
    console.log("Server is running")
})

app.post("/create", (req, res) => {

    var user_obj = new data ({
        User: req.get("user"),
        Password: req.get("password")
    })

    user_obj.save().then(() => {

        if(user_obj.isNew == false)
        {
            console.log("Saved data!")
            res.send("Saved data!")
        } else {
            console.log("Failed to save data")
        }
    })
})

//http://192.168.86.91:8081/create

// DELETE A NOTE
// POST request
app.post('/delete', (req, res) =>{
    data.findOneAndRemove({
        _id:req.get("id")
    }, (err) =>{
        console.log("Failed" + err)
    })
    res.send("Deleted!")
})


// UPDATE A NOTE
// POST request
app.post('/update', (req, res) =>{
    data.findOneAndUpdate(
        {_id:req.get("id")},
        {
            User:req.get("user"),
            Password: req.get("password")
        },
        (err) => {
            console.log("Failed to update " + err)
        })
    res.send("Updated")
})

// FETCH A NOTES
// GET Request
app.get('/user', (req, res) =>{
    data.find({}).then((dbitems)=>{
        res.send(dbitems)
    })
})

app.get('/user/:_id', (req, res) => {
    data.findById(req.params._id)
    .then(dbitems =>{
        if(!dbitems){
            return res.status(404).end();
        }   
        return res.status(200).json(dbitems);
        })
    })


