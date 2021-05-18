var mongoose = require("mongoose")
var Schema = mongoose.Schema

var user_obj = new Schema({
    User: String,
    Password: String
})

const data = mongoose.model("data", user_obj)

module.exports = data